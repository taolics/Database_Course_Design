# Generated by Django 3.1.3 on 2020-11-30 03:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0002_user_state'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='contact',
            field=models.CharField(default='contact', max_length=32),
        ),
        migrations.AddField(
            model_name='user',
            name='credit',
            field=models.IntegerField(default=0),
        ),
    ]