FROM centos:7
MAINTAINER Przemyslaw Ozgo linux@ozgo.info

ENV TS3_VERSION=3.0.12.4

RUN \
  rpm --rebuilddb && yum clean all && \
  yum install -y bzip2 wget && \
  yum clean all

COPY container-files /

ENTRYPOINT ["/bootstrap.sh"]

EXPOSE 9987/udp 10011 30033
