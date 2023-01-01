from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from leaderSignUp.models import event
from leaderSignUp.models import subEvent
from leaderSignUp.forms import leaderSignUp
from leaderSignUp.forms import createNewEvent, createNewSubEventLineFormset


@login_required
def indexView(request):
    event_list = event.objects.all()
    return render(request, 'leaderSignUp/index.html', {'event_list': event_list})
    
@login_required
def eventView(request, event_id ):
    event_master = get_object_or_404(event,pk = event_id)
    sub_event = subEvent.objects.filter(event_parent = event_id).order_by("group")
    context = {'event': event_master , 'sub_event': sub_event}
    return render(request, 'leaderSignUp/events.html',context )

@login_required
def subEventView(request, subEvent_id ):
    submitted = False
    sub_events = get_object_or_404(subEvent,pk = subEvent_id)
    if request.method =="POST":
        form = leaderSignUp(request.POST or None, instance=sub_events)
        if form.is_valid():
            form.save()
            redirect_url = reverse('subEvents', args = [subEvent_id])
            return HttpResponseRedirect(redirect_url + '?submitted=True')
    else:
        form = leaderSignUp(instance=sub_events)
        if 'submitted' in request.GET:
            submitted =True
        
    context = {'sub_events': sub_events,
                "form":form,
                'submitted':submitted}
    return render(request, 'leaderSignUp/event_detail.html',context )


@login_required
def createNewEventView(request):
    submitted = False
    
    if request.method =="POST":
        form = createNewEvent(request.POST or None)
        formset = createNewSubEventLineFormset(request.POST or None, instance=form.instance)
        formset.is_valid
        print(formset.non_form_errors())
        if form.is_valid() and formset.is_valid():
            form.save()
            for item in formset:
                try:
                    item.save()
                except:
                    continue
            redirect_url = reverse('index')
            return HttpResponseRedirect(redirect_url + '?submitted=True')
    else:
        form = createNewEvent()
        formset = createNewSubEventLineFormset()
        if 'submitted' in request.GET:
            submitted =True
        
    context = {
                "form":form,
                'submitted':submitted,
                'createNewSubEventLineFormset':createNewSubEventLineFormset}
    return render(request, 'leaderSignUp/create_new_event.html',context )


@login_required
def myEvents(request):
    sub_events= subEvent.objects.filter(Q(primary_leader=request.user.id) | Q(alternate_leader=request.user.id)).order_by("event_parent")
    context = {"sub_events":sub_events}
    return render(request, 'leaderSignUp/my_events.html', context)