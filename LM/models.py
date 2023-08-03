from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.contrib.auth.hashers import check_password as check_password_hashed
# from .models import ViewUser 
import uuid

class Letter(models.Model):
    srno = models.IntegerField(db_column='srno',primary_key=True)
    letter_no = models.CharField(db_column='Letter_no', max_length=255)  # Field name made lowercase.
    signing_date = models.DateField(db_column='Signing_date', blank=True, null=True)  # Field name made lowercase.
    receiving_date = models.DateField(db_column='Receiving_date', blank=True, null=True)  # Field name made lowercase.
    received_from = models.CharField(db_column='Received_from', max_length=255, blank=True, null=True)  # Field name made lowercase.
    subject = models.CharField(db_column='Subject', max_length=255, blank=True, null=True)  # Field name made lowercase.
    unit_assigned_to = models.CharField(db_column='Unit_Assigned_to', max_length=255, blank=True, null=True)  # Field name made lowercase.
    letter_assigned_to = models.CharField(db_column='Letter_assigned_to', max_length=255, blank=True, null=True)  # Field name made lowercase.
    mds_remark = models.TextField(db_column='MDs_remark', blank=True, null=True)  # Field name made lowercase.
    gms_remark = models.TextField(db_column='Gms_remark', blank=True, null=True)  # Field name made lowercase.
    deputy_gms_remark = models.TextField(db_column='Deputy_GMs_remark', blank=True, null=True)  # Field name made lowercase.
    fms_remark = models.TextField(db_column='Fms_remark', blank=True, null=True)  # Field name made lowercase.
    reply_date = models.DateField(db_column='Reply_date', blank=True, null=True)  # Field name made lowercase.
    reply_reference = models.CharField(db_column='Reply_reference', max_length=255, blank=True, null=True)  # Field name made lowercase.
#variable letter_no + signing_date
    class Meta:
        managed = False
        db_table = 'letter'



class ViewUser(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user_id = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    unit = models.CharField(max_length=255)
    status = models.CharField(max_length=255)
    # unit_assigned_to = models.CharField(max_length=100)
    # user = models.ForeignKey(ViewUser,on_delete=models.CASCADE, related_name='letters')

    class Meta:
        managed = False
        db_table = 'view_user'

    def check_password(self, raw_password):
        return (raw_password == self.password)

    def __str__(self):
        return self.user_id


