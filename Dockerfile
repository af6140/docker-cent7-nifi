FROM centos:7

MAINTAINER Dawei Wang<daweiwang.gatekeeper@gmail.com>

ENV REFRESHED_AT 2017-05-15

ARG HOST_UID=1000
ARG HOST_GID=1000

COPY nifi.repo /etc/yum.repos.d/
#COPY sensu.repo /etc/yum.repos.d/sensu.repo
#COPY entrypoint.sh /entrypoint.sh

RUN getent group nifi >/dev/null || groupadd -g ${HOST_GID} nifi && \
    getent passwd nifi >/dev/null || useradd -g ${HOST_GID} -u ${HOST_UID} -s /bin/bash -c "Nifi User" -m -d /var/lib/nifi nifi &&\
    yum -y install java-1.8.0-openjdk-devel && \
    yum install -y nifi && \
    yum clean all

WORKDIR /opt/nifi

USER nifi
ENTRYPOINT ["/opt/nifi/bin/nifi.sh"]
CMD ["start"]

