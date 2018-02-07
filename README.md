Simple repo to easily get logs to splunk using an HEC endpoint using syslog-ng

Installing Docker (Linux only):
```
command -v docker >/dev/null 2>&1 || { curl -s https://get.docker.com/ | bash; }
```

From the base dir of this repo

If you want to change your source type or index, do it in `sendtosplunk.sh` at the respective variables

Build your container:
```
docker build . --no-cache -t my-sysng-container:latest
```

Then run the container and mount in any logs you want watched. You can do folders, and it will recurse, but it's not set up to filter binary files.

An example:
```
sudo docker run --privileged -d --name easy-ng \
-e HOST_HOSTNAME=`hostname` \
-v "$(pwd)/syslog.conf":/etc/syslog-ng/syslog-ng.conf \
-v /var/log/jenkins/jenkins.log:/logs/jenkins.log \
-v /var/log/auth.log:/logs/auth.log \
-v /var/log/dpkg.log:/logs/dpkg.log \
-v /var/log/alternatives.log:/logs/alternatives.log \
-v /var/log/opscode:/logs/opscode \
my-sysng-container:latest
```

Quick note, trouble shooting this is lame since the docker container isn't build to output to docker logs. It's sort of ironic really.
