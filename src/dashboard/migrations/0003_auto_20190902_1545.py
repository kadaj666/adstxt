# Generated by Django 2.2.5 on 2019-09-02 15:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0002_auto_20190902_1532'),
    ]

    operations = [
        migrations.AlterField(
            model_name='domains',
            name='authority',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name='domains',
            name='publisher',
            field=models.CharField(max_length=100),
        ),
    ]
