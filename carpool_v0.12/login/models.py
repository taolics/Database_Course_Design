from django.db import models
import os

defaultpath = 'default.jpg'
# Create your models here.
class User(models.Model):
    gender=(
        ('male',"男"),
        ('female',"女"),
    )

    name=models.CharField(max_length=128,unique=True)
    password=models.CharField(max_length=256)
    contact = models.CharField(max_length=32,default="contact")
    email=models.EmailField(unique=True)
    sex=models.CharField(max_length=32,choices=gender,default="男")
    c_time=models.DateTimeField(auto_now_add=True)
    state = models.IntegerField(default=0)
    credit = models.IntegerField(default=0)
    imgpath = models.CharField(max_length=128,default=defaultpath)

    def __str__(self):
        return self.name

    class Meta:
        ordering=["-c_time"]
        verbose_name="用户"
        verbose_name_plural="用户"
