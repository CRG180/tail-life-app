from django.urls import path
#from django.views.generic import TemplateView
from leaderSignUp.views import indexView
from leaderSignUp.views import eventView
from leaderSignUp.views import subEventView

urlpatterns = [
    path('', indexView, name = 'index'),
    path('events/<int:event_id>/',eventView, name = 'events'),
    path('events_detail/<int:subEvent_id>/',subEventView, name = 'subEvents')
    ]