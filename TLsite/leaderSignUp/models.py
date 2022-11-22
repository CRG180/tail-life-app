from django.db import models
from phone_field import PhoneField

class trailGuideLeader(models.Model):
    last_name = models.CharField(max_length=200)
    first_name = models.CharField(max_length=200)
    middle_initial = models.CharField(max_length=5)
    email_address = models.EmailField(max_length=254)
    phone_number = PhoneField(blank=True, help_text='Contact phone number')

class eventType(models.Model):
    event_category = models.CharField(max_length=200) # weekday meeting, special event

class group(models.Model):
    group_name = models.CharField(max_length=200) # hawks A, Hawks B, Moutain Lions

class event(models.Model):
    title = models.CharField(max_length=200)
    description = models.CharField(max_length=1000)
    start = models.DateTimeField('Event start time')
    end = models.DateTimeField('Event end time')
    primary_leader = models.ForeignKey(trailGuideLeader, on_delete=models.RESTRICT, related_name='leader')
    alternate_leader = models.ForeignKey(trailGuideLeader, on_delete=models.RESTRICT, related_name='alternate_leader')

class subEvent(models.Model):
    title = models.CharField(max_length=200)
    description = models.CharField(max_length=1000)
    event_parent = models.ForeignKey(event, on_delete=models.RESTRICT)
    primary_leader = models.ForeignKey(trailGuideLeader, on_delete=models.RESTRICT, related_name='leader_sub_event')
    alternate_leader = models.ForeignKey(trailGuideLeader, on_delete=models.RESTRICT, related_name='alternate_leader_sub_event')
    group = models.ForeignKey(group, on_delete=models.CASCADE)

