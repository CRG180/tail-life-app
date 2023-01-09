from django.urls import path
from django.conf.urls.static import static
from django.conf import settings

from auth_user.views import (
    login_view,
    logout_view,
    register_view,
    profile_view
)

urlpatterns = [
    path('login/', login_view,name = 'login_view'),
    path('logout/',logout_view, name = 'logout_view'),
    path('register/', register_view,name = 'register_view'),
    path('profile/', profile_view,name = 'profile_view'),
 ]

if settings.DEBUG:
    urlpatterns += static(
        settings.MEDIA_URL,
        document_root = settings.MEDIA_ROOT,
    )