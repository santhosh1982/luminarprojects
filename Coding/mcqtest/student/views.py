from django.shortcuts import render,redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from teacher.models import AnswerSheets, StudentsList, chats
from .forms import StudentUpdationForm
from general.models import Profile

def home(request):
    data = AnswerSheets.objects.all()
    return render(request,'student/index.html',{'data':data})

def messages(request,pk):
    prof=Profile.objects.all()
    student_obj=get_object_or_404(StudentsList,pk=request.session['proid'])
    teacher_obj=get_object_or_404(Profile,pk=pk)
    msgs=chats.objects.filter(teacheruser__in=[teacher_obj],studentuser__in=[student_obj])
    return render(request, 'student/message.html',{'msgs':msgs,'prof':prof})
    
def studentprofile(request):
    objs=get_object_or_404(StudentsList,pk=request.session['proid'])
    if request.method == 'POST':
        obj=get_object_or_404(StudentsList,pk=request.session['proid'])
        obj.name=request.POST.get('name')
        obj.studentid=request.POST.get('studentid')
        obj.classes=request.POST.get('classes')
        obj.mobile=request.POST.get('mobile')
        obj.location=request.POST.get('location')
        obj.save(update_fields=["name","studentid","classes","mobile","location"])
        return redirect('student:studentprofile')
    return render(request,'student/studentdetails.html',{'obj':objs})
    
def results(request):
    sid=AnswerSheets.objects.filter(students=request.session['proid'])
    total=0.0
    counts=0
    for ss in sid:
        counts=counts+1
        total=total+float(ss.marks)
    if total==0.0:
        avgs=0.0
    else:
        avgs=total/counts
    
    return render(request,'student/results.html',{'sid':sid,'total':total,'avgs':avgs})
    
def chart(request):
    stid=StudentsList.objects.get(id=request.session['proid'])
    pr=AnswerSheets.objects.filter(students=stid)
    return render(request,'student/chart.html',{'pr':pr})