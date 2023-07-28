from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User
from django.contrib.auth import login,logout,authenticate
from django.contrib import messages
from .models import Letter

from .forms import LetterForm

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
            error='no'
        else:
            error='yes' 

    return render(request, 'adminlogin.html',locals())
def view_letter(request):
    letters=Letter.objects.all()
    return render(request, 'view_letter.html',locals())

def dashboard(request):
    return render(request, 'dashboard.html')

def view_user(request):
    return render(request, 'view_user.html')

def letter_info(request):
    if request.method=="POST":
        letter_no=request.POST.get('srNo')
        signing_date=request.POST.get('signdate')
        receiving_date=request.POST.get('receivedate')
        received_from=request.POST.get('receive_from')
        subject=request.POST.get('Subject')
        md=request.POST.get('MD')
        gm=request.POST.get('GM')
        dgm=request.POST.get('Deputy_GM')
        fm=request.POST.get('FM')
        unit=request.POST.get('UNIT')
        assigned=request.POST.get('Letter_Assigned')
        reply_ref=request.POST.get('reply')
        reply_date=request.POST.get('replydate')
        lt=Letter(letter_no=letter_no,signing_date=signing_date,receiving_date=receiving_date,
                  received_from=received_from,subject=subject,unit_assigned_to=unit,letter_assigned_to=assigned,
                  mds_remark=md,gms_remark=gm,deputy_gms_remark=dgm,fms_remark=fm,reply_date=reply_date,
                  reply_reference=reply_ref
                  )
        lt.save()
    return render(request, 'letter_info.html')


def delete_letter(request,pid):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    
    l = Letter.objects.get(srno=pid)
    l.delete() 

    return redirect('view_letter')

def edit_letter(request, pid):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    l = Letter.objects.get(srno=pid)
    return render(request,"edit_letter.html",{"Letter":l})



def update_letter(request, pid):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    updatel = Letter.objects.get(letter_no=pid)
    form = LetterForm(request.POST, instance=updatel)
    if form.is_valid():
        form.save()
        updatel.save()
        messages.success(request, "Letter Updated Successfully")
        return render(request, "edit_letter.html", {"Letter": updatel})
    else:
        return HttpResponse("Error: The form is not valid.")

