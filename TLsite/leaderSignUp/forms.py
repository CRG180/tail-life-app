from django import forms
from leaderSignUp.models import subEvent


class leaderSignUp(forms.ModelForm):
    class Meta:
        model = subEvent
        fields = ['primary_leader', 'alternate_leader']
