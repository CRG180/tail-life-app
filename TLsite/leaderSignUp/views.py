from django.shortcuts import get_object_or_404, render
from django.http import Http404
from leaderSignUp.models import event




def indexView(request):
    event_list = event.objects.all()
    return render(request, 'leaderSignUp/index.html', {'event_list': event_list})
    
    
def eventView(request, event_id ):
    event_detail = get_object_or_404(event,pk = event_id)
    return render(request, 'leaderSignUp/events.html', {'event': event_detail})