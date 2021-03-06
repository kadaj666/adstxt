# Generated by Django 3.1.7 on 2021-08-18 08:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0009_auto_20210816_1038'),
    ]

    operations = [
        migrations.AddField(
            model_name='project',
            name='url',
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='ftp_credential',
            name='host',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='ftp_credential',
            name='name',
            field=models.CharField(max_length=100),
        ),
    ]
