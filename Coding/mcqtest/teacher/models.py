from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.conf import settings
from django.core.urlresolvers import reverse
from general.models import Profile
import datetime
from general.models import Profile

class StudentsList(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL)
    name = models.CharField(max_length=200)
    studentid = models.CharField(max_length=200)
    classes = models.CharField(max_length=200)
    mobile = models.CharField(max_length=20)
    location = models.CharField(max_length=200)

class AnswerSheets(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL)
    students = models.ForeignKey(StudentsList)
    subject = models.CharField(max_length=200)
    classes = models.CharField(max_length=200)
    exam = models.CharField(max_length=200)
    marks = models.CharField(max_length=200)
    dateconducted = models.DateField()
    dateuploaded = models.DateField(auto_now=True)
    answerpapers = models.FileField(upload_to='uncorrected/')
        
class ExamDetails(models.Model):
    teacher = models.ForeignKey(settings.AUTH_USER_MODEL)
    student = models.ForeignKey(StudentsList)
    exam = models.CharField(max_length=200)
    subject = models.CharField(max_length=200)
    
class chats(models.Model):
    teacheruser = models.ForeignKey(settings.AUTH_USER_MODEL,related_name='send_message')
    message = models.CharField(max_length=200)
    studentuser = models.ForeignKey(StudentsList,related_name='recieve_message')
    sender = models.CharField(max_length=200)