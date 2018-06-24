FROM ubuntu:18.04

LABEL maintainer="alexander@bleissem.com"

RUN apt-get update && apt upgrade -y && apt-get install -y boinc-client boinc-manager

WORKDIR /var/lib/boinc-client

RUN /usr/bin/boinccmd --set_run_mode always
RUN /usr/bin/boinccmd --set_gpu_mode never
RUN /usr/bin/boinccmd --project_attach ${boincurl} ${boinckey}

CMD /etc/init.d/boinc-client start
