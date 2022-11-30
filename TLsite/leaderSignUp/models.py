from django.db import models
from phone_field import PhoneField

class trailGuideLeader(models.Model):
    last_name = models.CharField(max_length=200)
    first_name = models.CharField(max_length=200)
    middle_initial = models.CharField(max_length=5)
    email_address = models.EmailField(max_length=254)
    phone_number = PhoneField(blank=True, help_text='Contact phone number')

    def __str__(self):
        return f"{self.last_name}, {self.first_name}, {self.middle_initial}."

class eventType(models.Model):
    event_category = models.CharField(max_length=200) # weekday meeting, special event



    def __str__(self):
        return f"{self.event_category}"


class group(models.Model):
    group_name = models.CharField(max_length=200) # hawks A, Hawks B, Moutain Lions

    def __str__(self):
        return f"{self.group_name}"

class event(models.Model):
    title = models.CharField(max_length=200)
    eventType = models.ForeignKey(eventType, on_delete=models.CASCADE, default= '' )
    description = models.CharField(max_length=1000)
    start = models.DateTimeField('Event start time')
    end = models.DateTimeField('Event end time')
    primary_leader = models.ForeignKey(trailGuideLeader, on_delete=models.RESTRICT, related_name='leader')
    alternate_leader = models.ForeignKey(trailGuideLeader, on_delete=models.RESTRICT, related_name='alternate_leader')
    
    def __str__(self):
        return f"{self.title}, {self.start} ---- {self.eventType}"

class subEvent(models.Model):
    title = models.CharField(max_length=200)
    description = models.CharField(max_length=1000)
    event_parent = models.ForeignKey(event, on_delete=models.RESTRICT)
    primary_leader = models.ForeignKey(trailGuideLeader, on_delete=models.RESTRICT, related_name='leader_sub_event')
    alternate_leader = models.ForeignKey(trailGuideLeader, on_delete=models.RESTRICT, related_name='alternate_leader_sub_event')
    group = models.ForeignKey(group, on_delete=models.CASCADE)

