# Generated by Django 3.1.7 on 2021-08-18 09:51

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0010_auto_20210818_0846'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ftp_credential',
            name='name',
        ),
    ]