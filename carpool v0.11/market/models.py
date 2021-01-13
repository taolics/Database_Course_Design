from django.db import models
class Market(models.Model):
    
    username = models.CharField(max_length=128)
    seats = models.IntegerField()
    addinfo = models.CharField(max_length=128)
    departure = models.CharField(max_length=128)
    destination = models.CharField(max_length=128)
    time = models.DateTimeField('time', null=True)
    contact = models.CharField(max_length=32,default="contact")
    safe = models.IntegerField()

class Orders(models.Model):
	userid = models.CharField(max_length=128)
	orderid = models.CharField(max_length=128)
    
from login.models import User
class compinfo(models.Model):
    userac = models.ForeignKey(User, to_field='name', related_name='userac', on_delete=models.CASCADE, blank=True, null=True)
    userpa = models.ForeignKey(User, to_field='name', related_name='userpa', on_delete=models.CASCADE, blank=True, null=True)
    content = models.CharField(max_length=500)
    processstate = models.IntegerField(default = 0)
    adminid = models.CharField(max_length=100, default=' ')


class identifyinfo(models.Model):
    userid = models.CharField(max_length=128)
    adminid = models.CharField(max_length=128)
    stunumber = models.CharField(max_length=128,default='0')
    content = models.CharField(max_length=128,default='content')
    identifystate = models.IntegerField(default = 0)