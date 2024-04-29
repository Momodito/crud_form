FROM python:3.9

RUN apt-get update -y \
    && apt-get install -y python3-dev python3-pip python3-setuptools python3-wheel python3-cffi

WORKDIR /code

RUN apt-get update -y
RUN apt-get install -y nodejs

RUN apt-get install -y npm

RUN npm install --global yarn

RUN yarn install

COPY requirements.txt /code/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt --no-cache-dir
RUN pip install gunicorn

EXPOSE 8000
