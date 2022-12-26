from django.db import models
from phone_field import PhoneField

class trailGuideLeader(models.Model):
    last_name = models.CharField(max_length=200)
    first_name = models.CharField(max_length=200)
    middle_initial = models.CharField(max_length=5)
    email_address = models.EmailField(max_length=254)
    phone_number = PhoneField(help_text='Contact phone number',blank=True, null = True)

    def __str__(self):
        return f"{self.first_name} {self.middle_initial}. {self.last_name}"

class trailman(models.Model):
    last_name = models.CharField(max_length=200)
    first_name = models.CharField(max_length=200)
    middle_initial = models.CharField(max_length=5,blank=True, null = True)
    email_address = models.EmailField(max_length=254,blank=True, null = True)
    phone_number = PhoneField(help_text='Contact phone number',blank=True, null = True)
    birth_day = models.DateField('Trailmen Birthdate',blank=True, null = True)

    def __str__(self):
        return f"{self.first_name} {self.middle_initial}. {self.last_name}"

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
    description = models.CharField(max_length=1000, blank=True,null = True)
    start = models.DateTimeField('Event start time')
    end = models.DateTimeField('Event end time')
    primary_leader = models.ForeignKey(trailGuideLeader, on_delete=models.RESTRICT,
                related_name='leader',blank=True, null = True)
    alternate_leader = models.ForeignKey(trailGuideLeader, on_delete=models.RESTRICT,
         related_name='alternate_leader', blank=True, null = True)
    
    def __str__(self):
        return f"{self.title}"

class subEvent(models.Model):
    description = models.TextField(max_length=1000, blank=True, null = True)
    event_parent = models.ForeignKey(event, on_delete=models.RESTRICT)
    primary_leader = models.ForeignKey(trailGuideLeader, 
                                        on_delete=models.RESTRICT, related_name='leader_sub_event',
                                        blank=True, null = True)
    alternate_leader = models.ForeignKey(trailGuideLeader,
                                        on_delete=models.RESTRICT, 
                                        related_name='alternate_leader_sub_event', 
                                        blank = True,null = True)
    group = models.ForeignKey(group, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.group} {self.event_parent}"

class Sample(models.Model):
    attachment = models.FileField()