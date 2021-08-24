from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from .models import Source, Domains, Project, Ftp_credential
from .forms import NewDomains
from .serializers import ProjectSerializer, FtpSerializer, SourceSerializer, DomainsSerializer
from rest_framework import viewsets, permissions
from django.contrib import messages
import os, csv, re, json
from django_filters.rest_framework import DjangoFilterBackend
from auditlog.models import LogEntry



@login_required
def index(request):
    projects = Project.objects.all()
    context = {'projects': projects}
    return render(request, 'dashboard/index.html', context)

@login_required
def audit(request):
    history = LogEntry.objects.all()
    context = {'history': history}
    return render(request, 'dashboard/audit.html', context)

class ProjectViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer
    http_method_names = ['get', 'head', 'post', 'delete', 'patch']

class FtpViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Ftp_credential.objects.all()
    serializer_class = FtpSerializer
    http_method_names = ['get', 'head', 'post', 'delete', 'patch']

class SourceViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Source.objects.all()
    serializer_class = SourceSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['project']
    http_method_names = ['get', 'head', 'post', 'delete', 'patch']

class DomainsViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Domains.objects.all()
    serializer_class = DomainsSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['project']
    http_method_names = ['get', 'head', 'post', 'delete', 'patch']

@login_required
def project(request, project_id):
    project = Project.objects.get(id=project_id)
    domains = Domains.objects.filter(project=project)
    sources = Source.objects.filter(project=project)
    user = request.user
    Domainsform = NewDomains(project=project)
    if request.method == 'POST':
        form = NewDomains(request.POST, project=project)
        if form.is_valid():
            rawtext = form.cleaned_data['domain'].encode('utf8')
            rawtext = rawtext.decode()
            source = request.POST.get('source')
            source = Source.objects.get(id=source)
            for line in rawtext.splitlines():
                pattern = re.compile("\s*,\s*|\s+$")
                fields = ([x for x in pattern.split(line) if x])
                data_dict = {}
                data_dict["domain"] = fields[0].lower()
                data_dict["publisher"] = fields[1]
                data_dict["type"] = fields[2].upper()
                try:
                    data_dict["authority"] = fields[3]
                    if (len(data_dict["authority"])) != 16:
                        messages.error(request,   f'Сертификация ' + data_dict["authority"]+ ' не верна для ' + data_dict["domain"] )
                        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
                except:
                    data_dict["authority"] = ''

                defaults = {'user_rec': user}

                p, created = Domains.objects.get_or_create(
                    domain=data_dict["domain"],
                    publisher=data_dict["publisher"],
                    type=data_dict["type"],
                    authority=data_dict["authority"],
                    source=source,
                    project=project,
                    defaults=defaults,
                )
            messages.success(request, f'Новые записи добавлены')
            # export_csv()
            # ftp_upload()
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
        else:
            errMsg= None
            errMsg = [(v[0]) for k, v in form.errors.items()]
            errMsg = json.dumps(errMsg)
            messages.error(request, errMsg)
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

    context = {'project': project, 'domains': domains, 'sources':sources, 'form': Domainsform}
    return render(request, 'dashboard/project.html', context)

@login_required
def get_csv(project_id):
    project = Project.objects.get(id=project_id)
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="ads.txt"'
    writer = csv.writer(response)
    sources = Source.objects.filter(project=project).order_by('name')
    seen = set() 
    for source in sources:
        source_comment = '#'+ source.name
        domains = Domains.objects.filter(source=source, project=project).order_by('source', 'type', 'domain').values_list('domain','publisher', 'type', 'authority')
        if domains: 
            writer.writerow([source_comment])
            for domain in domains:
                if domain[3]:
                    dom = domain
                else:
                    dom = domain[:-1]
                if dom in seen: continue
                seen.add(dom)
                writer.writerow(dom)
    return response





