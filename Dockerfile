FROM simpleservices/python3:latest

COPY . /opt/project
WORKDIR /opt/project

RUN pip3 install -r requirements.txt

EXPOSE 5000

ENTRYPOINT wait-for postgres:5432 && python3 manage.py create_db && python3 manage.py runserver -h 0.0.0.0 


