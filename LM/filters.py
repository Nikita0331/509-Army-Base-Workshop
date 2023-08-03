import django_filters
from django_filters import DateFilter
from .models import * 
class LetterFilter(django_filters.FilterSet):
    class Meta:
        model=Letter
        fields='__all__'