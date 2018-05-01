FROM balabit/syslog-ng:latest

RUN apt-get update

RUN apt-get install curl -y --force-yes

ADD ./sendtosplunk.sh /

RUN chmod 777 /sendtosplunk.sh
