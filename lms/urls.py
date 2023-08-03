"""
URL configuration for lms project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from LM.views import *
admin.site.site_header = "Letter Management System"
admin.site.site_title = "Admin Portal"
admin.site.index_title = "Welcome to Letter Management Portal"

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name = "index"),
    path('index', index, name = "index"),
    path('adminlogin/', adminlogin, name = "adminlogin"),
    path('userlogin/', userlogin, name = "userlogin"),
    path('newuser/', newuser, name = "newuser"),
    path('home/', home, name = "home"),
    path('letter_info/', letter_info, name = "letter_info"),
    path('view_letter/', view_letter, name = "view_letter"),
    path('dashboard/', dashboard, name="dashboard"),
    path('search/',search,name="search"),
    path('search_user/',search_user,name="search_user"),
    path('view_user/',view_user,name="view_user"),
    path('delete_letter/<int:pid>',delete_letter, name='delete_letter'),
    path('newuser/', newuser, name='newuser'),
    path('dashboard_user/', dashboard_user, name='dashboard_user'),
    path('view_user/', view_user, name='view_user'),
    path('update_status/<str:user_id>/<str:status>/', update_status, name='update_status'),
    path('view_user_letter/', view_user_letter, name='view_user_letter'),
    path('edit_letter/<int:pid>',edit_letter, name='edit_letter'),
    path('update_letter/<int:pid>',update_letter, name='update_letter'),
    path('edit_user_letter/<int:pid>',edit_user_letter, name='edit_user_letter'),
    path('update_user_letter/<int:pid>',update_user_letter, name='update_user_letter'),
]
