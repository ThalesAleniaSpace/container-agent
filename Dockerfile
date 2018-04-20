FROM centos

ADD https://github.com/openfaas/faas/releases/download/0.7.1/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog
RUN yum install -y yum-utils device-mapper-persistent-data lvm2 &&\
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo &&\
    yum install -y docker-ce &&\
    yum install -y net-tools && yum clean all

ADD resources/host-ip.sh /opt/host-ip.sh

CMD chmod +x /opt/host-ip.sh
HEALTHCHECK --interval=5s CMD [ -e /tmp/.lock ] || exit 1
CMD ["fwatchdog"]
