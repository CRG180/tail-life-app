from django.contrib import admin
from .models import trailGuideLeader, trailman ,eventType, group, event
from .models import subEvent
admin.site.register(trailGuideLeader)
admin.site.register(trailman)
admin.site.register(eventType)
admin.site.register(group)
admin.site.register(event)
admin.site.register(subEvent)