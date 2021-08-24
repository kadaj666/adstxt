from django import template
from django.contrib.auth.models import User
from dashboard.models import Project

register = template.Library()

@register.simple_tag(name='menu_tags')
def projects_menu():
    projects_menu = Project.objects.all()
    return projects_menu

