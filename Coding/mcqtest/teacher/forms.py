from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import AnswerSheets, StudentsList, chats
from django.forms.widgets import TextInput

class DateInput(forms.DateInput):
    input_type = 'date'
    
class MyModelChoiceField(forms.ModelChoiceField):
    def label_from_instance(self, obj):
        return "{}".format(obj.name)

class AnswerSheetsUploadForm(forms.ModelForm):
    students = MyModelChoiceField(queryset = StudentsList.objects.all())
    class Meta:
        model = AnswerSheets
        fields = ('students','subject', 'classes', 'exam', 'dateconducted', 'answerpapers', )
        widgets = {
            'dateconducted': DateInput()
        }
        
class MessageForm(forms.ModelForm):
    class Meta:
        model = chats
        fields = ('message',)