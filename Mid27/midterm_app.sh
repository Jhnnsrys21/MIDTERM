#!/bin/bash

mkdir tempdi
mkdir tempdi/templates
mkdir tempdi/static

cp midterm_app.py tempdi/.
cp -r templates/* tempdi/templates/.
cp -r static/* tempdi/static/.

echo "FROM python"> tempdi/Dockerfile
echo "RUN pip install flask" >> tempdi/Dockerfile
echo "COPY ./static /home/myapp/static" >> tempdi/Dockerfile
echo "COPY ./templates /home/myapp/templates">> tempdi/Dockerfile
echo "COPY midterm_app.py /home/myapp">> tempdi/Dockerfile
echo "EXPOSE 5050" >> tempdi/Dockerfile
echo "CMD python3 /home/myapp/midterm_app.py">> tempdi/Dockerfile

cd tempdi
docker build -t midtermapp .
docker run -t -d -p 5050:5050 --name midtermrun midtermapp
docker ps -a