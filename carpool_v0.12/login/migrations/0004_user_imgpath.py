# Generated by Django 3.1.3 on 2021-01-14 04:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0003_auto_20201130_1155'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='imgpath',
            field=models.CharField(default='userimage/default.jpg', max_length=128),
        ),
    ]
