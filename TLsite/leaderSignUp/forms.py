from django import forms
from django.forms import inlineformset_factory
from django.contrib.admin.widgets import AdminDateWidget
from leaderSignUp.models import subEvent
from leaderSignUp.models import event, group



class leaderSignUp(forms.ModelForm):
    class Meta:
        model = subEvent
        fields = ['primary_leader', 'alternate_leader']



class createNewEvent(forms.ModelForm):
    class Meta:
        model = event
        fields = ['title','eventType', 'description', 'start', 'end', ]
    start = forms.DateTimeField(widget = forms.SelectDateWidget) 
    end = forms.DateTimeField(widget = forms.SelectDateWidget) 

class CustomMMCF(forms.ModelMultipleChoiceField):
    def label_from_instance(self, group):
        return "%s" % group.group_name

class createNewSubEvent(forms.ModelForm):
    class Meta:
        model = subEvent
        fields = ['group']


createNewSubEventLineFormset = inlineformset_factory(
    event,
    subEvent,
    form=createNewSubEvent,
    extra=group.objects.count(),
    can_delete=False,
    #max_num= 4,
    # fk_name="group",
    # fields=None, exclude=None, can_order=False,
    #  max_num=None, formfield_callback=None,
    # widgets=None, validate_max=False, localized_fields=None,
    # labels=None, help_texts=None, error_messages=None,
    # min_num=None, validate_min=False, field_classes=None
)