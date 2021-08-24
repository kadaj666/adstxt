from django.db import models
from django.contrib.auth.models import User
from django.conf import settings
from django.utils import timezone
from django.contrib.auth.models import User
from auditlog.registry import auditlog
from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
import csv
from django.http import HttpResponse
import io, os
from ftplib import FTP

class Project(models.Model):
    name = models.CharField(max_length=50)
    created = models.DateTimeField(auto_now_add=True)
    url = models.CharField(max_length=300, null=True, blank=True)
    def __str__(self):
        return self.name

class Ftp_credential(models.Model):
    project = models.OneToOneField(Project, on_delete = models.CASCADE, null=True)
    host = models.CharField(max_length=100)
    user = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    def __str__(self):
        return self.host


class Source(models.Model):
    name = models.CharField(max_length=50)
    project = models.ForeignKey(Project, on_delete=models.CASCADE, null=True)
    def __str__(self):
        return self.name

class Domains(models.Model):
    domain = models.CharField(max_length=30000)
    publisher = models.CharField(max_length=100)
    type = models.CharField(max_length=30)
    authority = models.CharField(max_length=100, blank=True)
    source = models.ForeignKey(Source, on_delete=models.SET_NULL, null=True)
    added_at = models.DateTimeField(auto_now_add=True)
    project = models.ForeignKey(Project, on_delete=models.CASCADE, null=True)
    user_rec = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    def __str__(self):
        return self.domain

@receiver(post_save, sender=Domains)
def upload_ftp_on_create(sender, instance, **kwargs):
    csv_file = (getUpload_csv(instance.project.id).getvalue())
    csv_file = io.BytesIO(bytes(csv_file, encoding='utf-8'))
    ftp_upload(csv_file, instance.project.id)

    
@receiver(post_delete, sender=Domains)
def upload_ftp_on_delete(sender, instance, **kwargs):
    csv_file = (getUpload_csv(instance.project.id).getvalue())
    csv_file = io.BytesIO(bytes(csv_file, encoding='utf-8'))
    ftp_upload(csv_file, instance.project.id)




def getUpload_csv(project_id):
    project = Project.objects.get(id=project_id)
    mem_file = io.StringIO()
    writer = csv.writer(mem_file)
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
    return mem_file


def ftp_upload(csv_file, project_id):
    project = Project.objects.get(id=project_id)
    try:
        ftp_server = Ftp_credential.objects.get(project=project)
        ftp = FTP(ftp_server.host)
        ftp.login(user=ftp_server.user, passwd=ftp_server.password)
        ftp.storbinary('STOR %s' % os.path.basename('ads.txt'), csv_file, 1024)
        ftp.quit()
    except:
        pass



auditlog.register(Domains)