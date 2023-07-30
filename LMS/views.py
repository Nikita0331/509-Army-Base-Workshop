from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User
from django.contrib.auth import login,logout,authenticate
from django.contrib import messages
from .models import Letter
from datetime import datetime

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
    if request.method == "GET":
        from_date_str = request.GET.get('search_from')
        to_date_str = request.GET.get('search_to')
        queryset = Letter.objects.all()

        if from_date_str:
            try:
                from_date = datetime.strptime(from_date_str, '%Y-%m-%d').date()
                queryset = queryset.filter(receiving_date__gte=from_date)
            except ValueError:
                pass

        if to_date_str:
            try:
                to_date = datetime.strptime(to_date_str, '%Y-%m-%d').date()
                queryset = queryset.filter(receiving_date__lte=to_date)
            except ValueError:
                pass

        return render(request, 'view_letter.html', {"letters": queryset})

    return render(request, 'view_letter.html', {"letters": Letter.objects.all()})

def dashboard(request):
    letter_count = Letter.objects.count()

    context = {
        'letter_count': letter_count,
        
        # Add more variables for other types of letters if needed
    }
    return render(request, 'dashboard.html',context)

def user_dashboard(request):
    letter_count = Letter.objects.count()

    context = {
        'letter_count': letter_count,
        
        # Add more variables for other types of letters if needed
    }
    return render(request, 'user_dashboard.html',context)

def view_user(request):
    return render(request, 'view_user.html')

from django.shortcuts import render, redirect
from .models import Letter

def letter_info(request):
    if request.method == "POST":
        letter_no = request.POST.get('srNo')
        signing_date = request.POST.get('signdate')
        receiving_date = request.POST.get('receivedate')
        received_from = request.POST.get('receive_from')
        subject = request.POST.get('Subject')
        md = request.POST.get('MD')
        gm = request.POST.get('GM')
        dgm = request.POST.get('Deputy_GM')
        fm = request.POST.get('FM')
        unit = request.POST.get('select_UNIT')
        assigned = request.POST.get('Letter_Assigned')
        reply_ref = request.POST.get('reply')
        reply_date = request.POST.get('replydate')

        if unit == "UNIT":
            unit = request.POST.get('unit_custom_value')
        # Save the data to the database
        lt = Letter(
            letter_no=letter_no,
            signing_date=signing_date,
            receiving_date=receiving_date,
            received_from=received_from,
            subject=subject,
            mds_remark=md,
            gms_remark=gm,
            deputy_gms_remark=dgm,
            fms_remark=fm,
            unit_assigned_to=unit,
            letter_assigned_to=assigned,
            reply_reference=reply_ref,
            reply_date=reply_date
        )
        lt.save()

        # Redirect to a success page or do something else
        return redirect('view_letter')  # Replace 'success_page' with the URL name of your success page

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
    return render(request,"edit_letter.html",{'l':l})


def convert_date(date_str):
    try:
        if date_str:
            return datetime.strptime(date_str, '%d-%m-%Y').date()
    except ValueError:
        pass
    return date_str  # Return the original date string when it's empty or invalid

def update_letter(request, pid):
    if not request.user.is_authenticated:
        return redirect('admin_login')

    letter_no = request.POST.get('srNo') 
    
    try:
        l = Letter.objects.get(srno=pid)
    except Letter.DoesNotExist:
        # Handle the case where the Letter object with the given pid does not exist
        return redirect('view_letter')  # Redirect to the view_letter page or handle the error in an appropriate way

    l.letter_no = letter_no

    # Update the signing_date field with the converted date
    signing_date_str = request.POST.get('signdate')
    receiving_date_str = request.POST.get('receivedate')
    reply_date_str = request.POST.get('replydate')
    
    l.signing_date = convert_date(signing_date_str)
    l.receiving_date = convert_date(receiving_date_str)
    l.reply_date = convert_date(reply_date_str)

    # Assign the remaining fields
    l.received_from = request.POST.get('receive_from')
    l.subject = request.POST.get('Subject')
    l.unit_assigned_to = request.POST.get('UNIT')
    l.letter_assigned_to = request.POST.get('Letter_Assigned')
    l.mds_remark = request.POST.get('MD')
    l.gms_remark = request.POST.get('GM')
    l.deputy_gms_remark = request.POST.get('Deputy_GM')
    l.fms_remark = request.POST.get('FM')
    l.reply_reference = request.POST.get('reply')

    # Check if "Section Assigned To" is set to "OTHERS" and handle custom value
    if l.unit_assigned_to == 'OTHERS':
        custom_unit = request.POST.get('custom_unit')
        if custom_unit and custom_unit not in ['PLG', 'Progress', 'Manufacture', 'Stats']:
            l.unit_assigned_to = custom_unit
        else:
            # If no custom value is provided or it matches one of the predefined options, set it back to "None"
            l.unit_assigned_to = 'None'
    else:
        # If not "OTHERS", set custom_unit to an empty string
        custom_unit = ''

    # Save the changes to the Letter object
    l.save()

    # Add a success message to display to the user
    messages.success(request, 'Letter updated successfully.')

    return redirect('view_letter')

def search(request):
    if request.method == "GET":
        letter_no = request.GET.get('Letter_no')
        unit_assigned_to = request.GET.get('Unit_Assigned_to')
        from_date_str = request.GET.get('search_from')
        to_date_str = request.GET.get('search_to')

        queryset = Letter.objects.all()

        if letter_no:
            queryset = queryset.filter(letter_no__icontains=letter_no)

        if unit_assigned_to: 
            queryset = queryset.filter(unit_assigned_to__icontains=unit_assigned_to)


        if from_date_str:
            try:
                from_date = datetime.strptime(from_date_str, '%Y-%m-%d').date()
                queryset = queryset.filter(signing_date__gte=from_date)
            except ValueError:
                pass

        if to_date_str:
            try:
                to_date = datetime.strptime(to_date_str, '%Y-%m-%d').date()
                queryset = queryset.filter(signing_date__lte=to_date)
            except ValueError:
                pass

        return render(request, 'search.html', {"Letter": queryset})