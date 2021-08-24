from django.urls import path

from . import views
from rest_framework import routers



router = routers.DefaultRouter()
router.register(r'project', views.ProjectViewSet)
router.register(r'ftp', views.FtpViewSet)
router.register(r'mediator', views.SourceViewSet)
router.register(r'domains', views.DomainsViewSet)

urlpatterns = [
    path('', views.index, name='dashboard'),
    path('details/<project_id>', views.project, name='project'),
    path('details/<project_id>/csv', views.get_csv, name='get_csv'),
    path('audit', views.audit, name='audit'),

]
