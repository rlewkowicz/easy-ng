FROM balabit/syslog-ng:latest

RUN apt update

RUN apt install curl -y

ADD ./sendtosplunk.sh /

RUN chmod 777 /sendtosplunk.sh
