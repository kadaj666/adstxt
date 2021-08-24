#!/bin/bash

apt-get update
apt-get install python3-dev -y
pip3 install -r /opt/requirements.txt
cd /opt
python manage.py makemigrations
python manage.py migrate
cd /opt && python manage.py runserver 0.0.0.0:9000