from django.urls import path
#from django.views.generic import TemplateView
from leaderSignUp.views import indexView
from leaderSignUp.views import eventView
from leaderSignUp.views import subEventView
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('', indexView, name = 'index'),
    path('events/<int:event_id>/',eventView, name = 'events'),
    path('events_detail/<int:subEvent_id>/',subEventView, name = 'subEvents')
    ]

if settings.DEBUG:
    urlpatterns += static(
        settings.MEDIA_URL,
        document_root = settings.MEDIA_ROOT,
        )