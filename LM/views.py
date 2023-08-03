from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User
from django.contrib.auth import login,logout,authenticate
from .models import Letter
from datetime import datetime
from .forms import LetterForm
from LM.models import ViewUser
from django.contrib import messages 
from django.contrib.auth.backends import BaseBackend
from django.contrib.auth.models import User
from django.contrib.auth.decorators import user_passes_test
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
# Create your views here.
def index(request):
    context={
        "variable" : "this is sent"
        }
    return render(request, 'index.html', context)

def home(request):
    return render(request, 'home.html')  



def adminlogin(request):
    error = ""
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        print(user)
        if user:
            login(request, user)
            error = "no"
            return redirect('dashboard')
        else:
            error = "yes"
            return redirect('adminlogin')
    return render(request, 'adminlogin.html',locals())
 


def delete_letter(request,pid):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    
    l = Letter.objects.get(srno=pid)
    l.delete() 

    return redirect('view_letter')

def dashboard(request):
    letter_count = Letter.objects.count()

    context = {
        'letter_count': letter_count,
        
        # Add more variables for other types of letters if needed
    }
    return render(request, 'dashboard.html',context)

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

        if unit == "OTHER":
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



def addletter(request):
    return render(request, 'letter_info.html')

def view_user(request):
    return render(request,'view_user.html')

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


# # Create your views here.

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

def dashboard_user(request):
    unit = request.session.get('unit')
    letter_count = Letter.objects.filter(unit_assigned_to=unit).count()

    context = {
        'letter_count': letter_count,
        
        # Add more variables for other types of letters if needed
    }
    return render(request, 'dashboard_user.html',context)


# ... other imports and views ...

class CustomAuthBackend(ModelBackend):
    def authenticate(self, request, user_id=None, password=None, unit=None, **kwargs):
        # Check if the user is logging in from the admin section
        if request.path.startswith('/admin/'):
            return None  # Prevent authentication for admin section users

        try:
            # Attempt to retrieve the user from the custom ViewUser model
            view_user = ViewUser.objects.get(user_id=user_id)

            # Check if the user is active and if the password and unit match
            if view_user.status == 'active' and view_user.check_password(password) and view_user.unit == unit:
                # Use the user_id field from ViewUser model for authentication
                user, _ = User.objects.get_or_create(username=view_user.user_id)
                return user
        except ViewUser.DoesNotExist:
            pass

        return None  # Return None if authentication fails

    def get_user(self, user_id):
        try:
            return User.objects.get(username=user_id)
        except User.DoesNotExist:
            return None

def userlogin(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        unit = request.POST['unit']

        # Authenticate the user using the custom authentication backend
        user = CustomAuthBackend().authenticate(request, user_id=username, password=password, unit=unit)

        if user is not None:
            # If the user is valid, log them in and redirect to the home page
            user.backend = 'LM.backends.CustomAuthBackend'

            login(request, user)
            request.session['unit'] = unit
            messages.success(request, "User logged in successfully!")
            return redirect('dashboard_user')
        else:
            # If the user is not valid, show an error message
            error_message = "Invalid username or password."
            return render(request, 'userlogin.html', {'error': 'yes'})

    return render(request, 'userlogin.html')
    
def newuser(request):
    if request.method == 'POST':
        user_id = request.POST.get('id')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')
        unit = request.POST.get('unit')
        status = 'active'  # Set the initial status as 'active'

        # Check if the user_id is unique
        if ViewUser.objects.filter(user_id=user_id).exists():
            error_message = "User ID already exists. Please choose a different one."
            return render(request, 'newuser.html', {'error_message': error_message})

        # Check if password and confirm_password match
        if password != confirm_password:
            error_message = "Passwords do not match. Please try again."
            return render(request, 'newuser.html', {'error_message': error_message})

        # Save the new user to the database
        user = ViewUser(user_id=user_id, password=password, unit=unit, status=status)
        user.save()

        messages.success(request, "User created successfully!")  # Add success message
        return redirect('newuser')

    return render(request, 'newuser.html')


@login_required
def view_user(request):
    users = ViewUser.objects.all()
    return render(request, 'view_user.html', {'users': users})


@csrf_exempt
def update_status(request, user_id, status):
    try:
        user = ViewUser.objects.get(user_id=user_id)
        user.status = status
        user.save()
        return JsonResponse({'success': True})
    except ViewUser.DoesNotExist:
        return JsonResponse({'success': False})

def view_user_letter(request):
    if request.method == "GET":
        from_date_str = request.GET.get('search_from')
        to_date_str = request.GET.get('search_to')
        unit = request.session.get('unit')
        queryset = Letter.objects.filter(unit_assigned_to = unit)

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

        return render(request, 'view_user_letter.html', {"letters": queryset})

    return render(request, 'view_user_letter.html', {"letters": Letter.objects.all()})

def search_user(request):
    if request.method == "GET":
        letter_no = request.GET.get('Letter_no')
        unit_assigned_to = request.GET.get('Unit_Assigned_to')
        from_date_str = request.GET.get('search_from')
        to_date_str = request.GET.get('search_to')
        unit = request.session.get('unit')

        queryset = Letter.objects.filter(unit_assigned_to = unit)

        if letter_no:
            queryset = queryset.filter(letter_no__icontains=letter_no)

       

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

        return render(request, 'search_user.html', {"Letter": queryset})
    

def edit_user_letter(request, pid):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    l = Letter.objects.get(srno=pid)
    return render(request,"edit_user_letter.html",{'l':l})


def update_user_letter(request, pid):
    if not request.user.is_authenticated:
        return redirect('admin_login')

    letter_no = request.POST.get('srNo') 
    
    try:
        l = Letter.objects.get(srno=pid)
    except Letter.DoesNotExist:
        # Handle the case where the Letter object with the given pid does not exist
        return redirect('view_user_letter')  # Redirect to the view_letter page or handle the error in an appropriate way

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

    return redirect('view_user_letter')
