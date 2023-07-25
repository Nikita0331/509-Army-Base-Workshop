from django import forms 
from .models import Letter
from django.core.exceptions import ValidationError
from datetime import date

# forms.py

from django import forms
from django.core.exceptions import ValidationError
from datetime import datetime

class UpdateLetterForm(forms.ModelForm):
    class Meta:
        model = Letter
        fields = ['receiving_date', 'received_from', 'reply_reference', 'reply_date']

    def clean_receiving_date(self):
        receiving_date = self.cleaned_data['receiving_date']
        # Your custom date validation if needed
        return receiving_date

    def clean_reply_date(self):
        reply_date = self.cleaned_data['reply_date']
        # Your custom date validation if needed
        return reply_date
    

class updateforms(forms.ModelForm):
    class Meta:
        model=Letter
        fields="__all__"