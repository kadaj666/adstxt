from django.forms import ModelForm
from django import forms
from django.db import models
from .models import Domains, Source



class NewSource(ModelForm):
    name = forms.CharField(label='Медиатор', max_length=100, widget=forms.TextInput(attrs={'class': 'form-control', 'autofocus': True, 'placeholder':'Source name'}))
    class Meta:
        model = Source
        fields = ['name']


class NewDomains(ModelForm):

    domain = forms.CharField(label='Ads.txt records (line by line)', widget=forms.Textarea(attrs={'class': 'form-control', 'autofocus': True, 'placeholder':'Domain csv'}))
    source = forms.ModelChoiceField(label='Source',queryset=None, initial=0, required=True, widget=forms.Select(attrs={'class': 'form-control', 'autofocus': True, 'placeholder':'Project type'}) )
    class Meta:
        model = Domains
        fields = ['source', 'domain']

    def __init__(self, *args, **kwargs):
        
        project = kwargs.pop('project')
        super(NewDomains, self).__init__(*args, **kwargs)
     
        self.fields['source'].queryset = Source.objects.filter(project=project).order_by('name')

