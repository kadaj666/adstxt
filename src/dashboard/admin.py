from django.contrib import admin
from .models import Source, Domains, Project, Ftp_credential

admin.site.register(Project)
admin.site.register(Source)
admin.site.register(Domains)
admin.site.register(Ftp_credential)