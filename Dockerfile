FROM ubuntu:18.04

LABEL maintainer="alexander@bleissem.com"

RUN apt-get update
RUN  apt-get install -y --no-install-recommends apt-utils

RUN apt-get update && apt upgrade -y && apt-get install -y boinc-client boinc-manager

WORKDIR /var/lib/boinc-client

CMD /etc/init.d/boinc-client start; sleep 5; /usr/bin/boinccmd --project_attach ${boincurl} ${boinckey}
