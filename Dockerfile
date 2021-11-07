FROM python:3.6

ADD final.py requirements.txt ec2-keypair.pem /
RUN pip install -r requirements.txt

CMD [ "python", "./final.py" ]
