"""
URL configuration for LM project.

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
from django.urls import path, include
from LMS import views


admin.site.site_header = "Letter Management System"
admin.site.site_title = "Admin Portal"
admin.site.index_title = "Welcome to Letter Management Portal"

urlpatterns = [
    path('admin/', admin.site.urls),
    path("home",views.home,name="home"),
    path('', views.index,name="index"),
    path('index', views.index,name="index"),
    path("adminlogin",views.adminlogin,name="adminlogin"),
    path("newuser" ,views.newuser,name="newuser"),
    path("userlogin",views.userlogin,name="userlogin"),
    path('letter_info/', views.letter_info, name = "letter_info"),
    path('view_letter/', views.view_letter, name = "view_letter"),
    path('view_user/', views.view_user, name = "view_user"),
    path('dashboard/', views.dashboard, name = "dashboard"),
    path('delete_letter/<int:pid>',views.delete_letter, name='delete_letter'),
    path('edit_letter/<int:pid>',views.edit_letter, name='edit_letter'),
    path('update_letter/<int:pid>',views.update_letter, name='update_letter'),
    path('search/',views.search,name="search"),
    path('user_dashboard/', views.user_dashboard, name = "user_dashboard"),

]
