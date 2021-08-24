from django import forms
from django.contrib.auth.forms import AuthenticationForm




class UserLoginForm(AuthenticationForm):
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control input-shadow', 'autofocus': True, 'placeholder':'Enter Username'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control input-shadow', 'required': True, 'placeholder':'Enter Password'}))

