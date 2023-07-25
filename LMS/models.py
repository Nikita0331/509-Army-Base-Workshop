from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Letter(models.Model):
    letter_no = models.IntegerField(db_column='Letter_no', primary_key=True)  # Field name made lowercase.
    signing_date = models.DateField(db_column='Signing_date')  # Field name made lowercase.
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
    
    class Meta:
         managed = False
         db_table = 'letter'