from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from .forms import AnswerSheetsUploadForm, MessageForm
from .models import AnswerSheets
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from django.conf import settings
import os
import csv
from .models import StudentsList, chats
from general.models import Profile
from .imageanalysis import imganalysis
from django.db.models import Count

@login_required
def home(request):
    data = AnswerSheets.objects.all()
    return render(request,'teacher/index.html',{'data':data})
    
@login_required
def viewstudentslist(request):
    data = StudentsList.objects.all()
    return render(request,'teacher/viewstudentslist.html',{'data':data})
    
@login_required
def UploadAnswerSheets(request):
    form = AnswerSheetsUploadForm(request.POST or None, request.FILES)
    if form.is_valid():
        propdet = form.save(commit=False)
        propdet.user = request.user
        propdet.save()
        scr=imganalysis(propdet.answerpapers.path,propdet.answerpapers.name[12:])
        propdet.marks=scr
        propdet.save()
        return redirect('teacher:home')
    return render(request, 'teacher/uploadanswersheets.html', {'form':form})

@login_required
def simple_upload(request):
    if request.method == 'POST':
        users=request.user
        new_persons = request.FILES['myfile']
        path = default_storage.save('somename.csv', ContentFile(new_persons.read()))
        tmp_file = os.path.join(settings.MEDIA_ROOT, path)
        '''d=new_persons.url'''
        eod=settings.MEDIA_ROOT+'\somename.csv'
        with open(eod) as f:
            reader = csv.reader(f)
            for row in reader:
                created = StudentsList.objects.get_or_create(
                    user=users,
                    name=row[0],
                    studentid=row[1],
                    classes=row[2],
                    mobile=row[3],
                    location=row[4],
                    )
        return redirect('teacher:viewstudentslist')
    return render(request, 'teacher/import.html')
    
@login_required
def correctedpapersList(request):
    data = AnswerSheets.objects.all()
    return render(request, 'teacher/correctedpaperslist.html',{'data':data})
    
@login_required
def messages(request,pk):
    prof=StudentsList.objects.all()
    prid=get_object_or_404(StudentsList,pk=pk)
    msgs=chats.objects.filter(teacheruser__in=[request.user],studentuser__in=[prid])
    msgfrm = MessageForm(request.POST or None)
    if msgfrm.is_valid():
        msgfrm.save(commit=False)
        msgfrm.teacheruser=request.user
        msgfrm.studentuser=prid
        msgfrm.sender='teacher'
        msgfrm.save()
    return render(request, 'teacher/messages.html',{'msgs':msgs,'prof':prof,'msgfrm':msgfrm})
    
@login_required
def chart(request):
    subjects=AnswerSheets.objects.values('subject').annotate(total=Count('subject')).order_by('subject')
    return render(request,'teacher/chart.html',{'subjects':subjects})

@login_required
def chart1(request):
    subjects=AnswerSheets.objects.values('classes').annotate(total=Count('classes')).order_by('classes')
    return render(request,'teacher/chart1.html',{'subjects':subjects})