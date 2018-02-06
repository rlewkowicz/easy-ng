#!/bin/bash
SOURCETYPE='manual-HEC'
INDEX='your-index'
HEC_TOKEN='578395BB-A611-2166-A564-D4494459D323' #You need a token, this one will not work.
HOST=${HOST_HOSTNAME} #You can change this, but it should get passed in from the host
while read line ; do
  (curl -k "http://yoursplunkdomain.com:8088/services/collector" \ #You need to chane this
  -H "Authorization: Splunk $HEC_TOKEN" \
  -d "{\"event\": \"$line\", \"sourcetype\": \"$SOURCETYPE\", \"index\": \"$INDEX\", \"host\": \"$HOST\"}"&)
done
