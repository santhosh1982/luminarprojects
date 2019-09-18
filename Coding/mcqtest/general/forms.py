from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.forms import widgets
from .models import Profile
from .choices import *
from django.forms.widgets import PasswordInput, TextInput,DateInput,EmailInput,Select

class SignUpForm(UserCreationForm):
    first_name = forms.CharField(widget=TextInput(attrs={'class':'userna common','placeholder': 'First Name'}))
    last_name = forms.CharField(widget=TextInput(attrs={'class':'userna common','placeholder': 'Last Name'}))
    username = forms.CharField(widget=TextInput(attrs={'class':'userna common','placeholder': 'User Name'}))
    password = forms.CharField(widget=PasswordInput(attrs={'class':'passwo common','placeholder':'Password'}))
    password1 = forms.CharField(widget=PasswordInput(attrs={'class':'passwo common','placeholder':'Confirm Password'}))
    password2 = forms.CharField(widget=PasswordInput(attrs={'class':'passwod common','placeholder':'Confirm Password'}))
    email = forms.CharField(widget=EmailInput(attrs={'class':'email common','placeholder':'Email'}))
    location = forms.CharField(widget=TextInput(attrs={'class': 'location common','placeholder': 'Location'}))
    birth_date = forms.DateField(help_text='Required. Format: YYYY-MM-DD',widget=DateInput(attrs={'class':'bod common','placeholder':'Date Of Birth (YYYY-MM-DD)'}))
    class Meta:
        model = Profile
        fields = ('first_name', 'last_name', 'username', 'password', 'password1', 'email','location','birth_date')