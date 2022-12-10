from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.urls import reverse
from leaderSignUp.models import event
from leaderSignUp.models import subEvent
from leaderSignUp.forms import leaderSignUp


def indexView(request):
    event_list = event.objects.all()
    return render(request, 'leaderSignUp/index.html', {'event_list': event_list})
    

def eventView(request, event_id ):
    event_master = get_object_or_404(event,pk = event_id)
    sub_event = subEvent.objects.filter(event_parent = event_id).order_by("group")
    context = {'event': event_master , 'sub_event': sub_event}
    return render(request, 'leaderSignUp/events.html',context )

def subEventView(request, subEvent_id ):
    submitted = False
    sub_events = get_object_or_404(subEvent,pk = subEvent_id)
    if request.method =="POST":
        form = leaderSignUp(request.POST or None, instance=sub_events)
        if form.is_valid():
            form.save()
            redirect_url = reverse('subEvents', args = [subEvent_id])
            print(redirect_url)
            return HttpResponseRedirect(redirect_url + '?submitted=True')
    else:
        form = leaderSignUp(instance=sub_events)
        if 'submitted' in request.GET:
            submitted =True
        
    context = {'sub_events': sub_events,
                "form":form,
                'submitted':submitted}
    return render(request, 'leaderSignUp/event_detail.html',context )