from django import forms 
from .models import Letter
from django.core.exceptions import ValidationError
from datetime import datetime

# forms.py
from django import forms
from .models import Letter

class LetterForm(forms.ModelForm):
    class Meta:
        model = Letter
        fields = '__all__'
    
    signing_date = forms.DateField(input_formats=['%d/%m/%Y'])
    receiving_date = forms.DateField(input_formats=['%d/%m/%Y'], required=False)
    reply_date = forms.DateField(input_formats=['%d/%m/%Y'], required=False)
