FROM	ldti/nanoserver-python:3.7.3-1809

ADD	. /app
WORKDIR	/app

EXPOSE 80

RUN	pip install -r req.txt

CMD	["python", "pykms_server.py"]
