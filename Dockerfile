FROM centos:7

LABEL maintainer daweiwang.gatekeeper@gmail.com


ARG HOST_UID=1000
ARG HOST_GID=1000

COPY nifi.repo /etc/yum.repos.d/

RUN getent group nifi >/dev/null || groupadd -g ${HOST_GID} nifi && \
    getent passwd nifi >/dev/null || useradd -g ${HOST_GID} -u ${HOST_UID} -s /bin/bash -c "Nifi User" -m -d /var/lib/nifi nifi &&\
    yum -y install java-1.8.0-openjdk-devel && \
    yum install -y nifi && \
    yum install -y nifi-docs && \
    yum clean all

WORKDIR /opt/nifi

USER nifi

VOLUME /var/lib/nifi
VOLUME /opt/nifi/flow

EXPOSE 8080

ENTRYPOINT ["/opt/nifi/bin/nifi.sh"]
CMD ["start"]

