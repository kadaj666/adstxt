from django.contrib.auth.models import User, Group
from rest_framework import serializers
from .models import Project, Ftp_credential, Source, Domains
from django.utils.timesince import timesince
import json


class ProjectSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Project
        fields = ('__all__')



class FtpSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Ftp_credential
        fields = ('__all__')

class SourceSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Source
        fields = ('__all__')

class DomainsSerializer(serializers.HyperlinkedModelSerializer):
    source_name = serializers.SerializerMethodField(method_name='get_mediator_name')
    user_rec = serializers.SerializerMethodField(method_name='get_username')
    class Meta:
        model = Domains
        fields = ('__all__')
    def get_mediator_name(self, instance):
        return instance.source.name
    def get_username(self, instance):
        return instance.user_rec.username