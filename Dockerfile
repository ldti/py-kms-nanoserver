FROM ldti/nanoserver-python:3.7.3-1809 AS stage1

WORKDIR /app
RUN curl -OL https://github.com/SystemRage/py-kms/tarball/master &&\
	Tar.exe -xf master &&\
	move SystemRage-py-kms-dead208\py-kms\* . &&\
	rmdir /s /q SystemRage-py-kms-dead208 &&\
	del /q master 

RUN	pip install argparse==1.4.0 peewee


FROM ldti/nanoserver-python:3.7.3-1809
WORKDIR /app
COPY --from=stage1 /app/ .

EXPOSE 80

CMD	["python", "pykms_server.py"]
