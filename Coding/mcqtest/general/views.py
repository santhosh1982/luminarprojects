from django.shortcuts import render, redirect, render_to_response
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login, authenticate
from .models import Profile
from .forms import SignUpForm
from teacher.models import StudentsList

@login_required(login_url='/login/')
def home(request):
        return redirect('teacher:home')
"""
def registration(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            #user.refresh_from_db()  # load the profile instance created by the signal
            #user.profile.user_type = form.cleaned_data.get('usertype')
            #user.save()
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=user.username, password=raw_password)
            if user.is_active:
                login(request, user)
            return redirect('/login/')
    else:
        form = SignUpForm()
    return render(request, 'signup.html', {'form': form})
"""

def login_user(request, template_name):
    dets=False
    dee=0
    if request.method == 'POST':
        if 'submit' in request.POST:
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return redirect('teacher:home')
    return render(request,template_name, )

def login_student_user(request, template_name):
    if request.method == 'POST':
        username = request.POST['username1']
        password = request.POST['password1']
        try:
            prod = StudentsList.objects.filter(name=username,studentid=password)
            if not prod:
                dets=True
                return redirect('general:login')
            else:
                for pr in prod:
                    request.session['proid']=pr.id
                if 'proid' not in request.session:
                    dee=prd
                    dets=True
                    return render_to_response(template_name,{'dets':dets,'dee':dee})
                else:
                    return redirect('student:home')
        except StudentsList.DoesNotExist:
            dets=True
            return render_to_response(template_name,{'dets':dets,'dee':dee})
    return render(request,template_name, )
    
def registration(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            user.refresh_from_db()  # load the profile instance created by the signal
            user.save()
            return redirect('/login/')
    else:
        form = SignUpForm()
    return render(request, 'general/signup.html', {'form': form})
    
def logout(request):
    del request.session['proid']
    request.session.modified = True
    if 'proid' not in request.session:
        return redirect('general:studentlogin')

def signupag(request):
    if request.method == 'POST':
        form = SignUpFormag(request.POST)
        if form.is_valid():
            user = form.save()
            user.refresh_from_db()  # load the profile instance created by the signal
            user.save()
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=user.username, password=raw_password)
            login(request, user)
            return redirect('login')
    else:
        form = SignUpFormag()
    return render(request, 'general/signup.html', {'form': form})