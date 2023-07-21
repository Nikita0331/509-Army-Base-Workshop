from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User
from django.contrib.auth import login,logout,authenticate
from django.contrib import messages

# Create your views here.
def index(request):
    context={
        "variable" : "this is sent"
        }
    return render(request, 'index.html', context)
    return HttpResponse("this is start")

def about(request):
    return HttpResponse("this is about")

def home(request):
    if request.user.is_authenticated:
        #pr=profilepic.objects.all().filter(user=request.user)
        #c={"img":pr}
        return render(request,"home.html",locals())
    else:
        return redirect('/signin')
    
def newuser(request):
    error = ""
    if request.method == "POST":
        uid = request.POST['userid']
        em = request.POST['email']
        pwd = request.POST['pwd']
        try:
            user = User.objects.create_user(first_name = fn, last_name = ln, username = em, password = pwd)
            error = "no"
        except:
            error = "yes"
        
    return render(request, 'newuser.html', locals())

def userlogin(request):
    error = ""
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            error = "no"
            
        else:
            error = "yes"
            

    return render(request, 'userlogin.html',locals())
        

def adminlogin(request):
    error = ""
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            return redirect('home')
        else:
            return redirect('adminlogin')

    return render(request, 'adminlogin.html',locals())

def letter_info(request):
    return render(request, 'letter_info.html')

def view_letter(request):
    return render(request, 'view_letter.html')