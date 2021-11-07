FROM python:3.6

ADD final.py requirements.txt ec2-keypair.pem /

RUN python3 -m pip install --upgrade pip
RUN pip install -r requirements.txt

ENV AWS_ACCESS_KEY_ID=ASIAZ72S6JWVWZJF5R56
ENV AWS_SECRET_ACCESS_KEY=oqbQRIpCL1X+PoC9M7ZJFe/ioE5isKP+ks5ZcpXn
ENV AWS_SESSION_TOKEN=FwoGZXIvYXdzEBQaDA0LyaYL6WdA5yyyICLLATdJeSUCH8geBl397B4bY9e73y8mQkXhXGp52yXi9QgfZHjxuYiQv+khjGZeCnTeD0xmnQmKGCxAsQxiFb/0DA+uBdwH4sapvzkbVlUItJUmrpq00L3cnHWU6jdeX1XEmvzmNoe1pKW/+H+NhD1brLpM+EIU8hyKnRm1o93w7jLlwDN92tc7rpRfHSPHh1Pc4PvTYkYwR6Ec0sBNndV8jSl5btKGA46no/Ia+tJAzxBzoxToVpuFEctJWcS3N3Mqk/mJSVRJd9I2OJo6KIC1oIwGMi1CmHoFG2Jib+WyxZX62jBF7lcf86wEi6zd67bpgaGkiI4aosXRaWGZMjsCkX4=
ENV AWS_REGION=us-east-1
ENV AWS_DEFAULT_REGION=us-east-1
RUN aws ecr get-login --region ${AWS_REGION}

CMD [ "python", "./final.py" ]
