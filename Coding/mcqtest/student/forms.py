from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from teacher.models import AnswerSheets, StudentsList
from django.forms.widgets import TextInput

class StudentUpdationForm(forms.ModelForm):
    class Meta:
        model = StudentsList
        fields = ('name','studentid', 'classes', 'mobile', 'location', )