# Generated by Django 3.1.3 on 2020-12-01 03:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('market', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='compinfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('userac', models.CharField(max_length=128)),
                ('userpa', models.CharField(max_length=128)),
                ('content', models.CharField(max_length=500)),
                ('processstate', models.IntegerField(default=0)),
                ('adminid', models.CharField(max_length=128)),
            ],
        ),
        migrations.CreateModel(
            name='identifyinfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('userid', models.CharField(max_length=128)),
                ('adminid', models.CharField(max_length=128)),
                ('stunumber', models.CharField(default='0', max_length=128)),
                ('content', models.CharField(default='content', max_length=128)),
                ('identifystate', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Orders',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('userid', models.CharField(max_length=128)),
                ('orderid', models.CharField(max_length=128)),
            ],
        ),
        migrations.AlterField(
            model_name='market',
            name='seats',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='market',
            name='time',
            field=models.DateTimeField(null=True, verbose_name='time'),
        ),
    ]
