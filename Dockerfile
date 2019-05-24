FROM applemann/python2:latest

COPY . /opt/project
WORKDIR /opt/project

RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT wait-for postgres:5432 && python manage.py create_db && python manage.py runserver -h 0.0.0.0 
#&& python manage.py db init && python manage.py db migrate && python manage.py runserver


