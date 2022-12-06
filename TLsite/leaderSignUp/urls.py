from django.urls import path
#from django.views.generic import TemplateView
from leaderSignUp.views import indexView
from leaderSignUp.views import eventView

urlpatterns = [
    path('', indexView, name = 'index'),
    path('events/<int:event_id>/',eventView, name = 'events')
    ]