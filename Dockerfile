FROM ubuntu:trusty
MAINTAINER rberrelleza@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN echo 'deb http://download.jitsi.org/nightly/deb unstable/' >> /etc/apt/sources.list && \
  apt-get update -y && \
  apt-get install -y wget && \
  wget -qO - https://download.jitsi.org/nightly/deb/unstable/archive.key | apt-key add - && \
  apt-get update && \
  apt-get -y install jitsi-meet prosody && \
  apt-get clean && \
  mkdir /root/samples && \
  mkdir /var/run/prosody && \
  chown prosody /var/run/prosody && \
  touch /root/.first-boot && \
  mkdir /keys && \
  mkdir /recordings

EXPOSE 80 443
EXPOSE 10000-20000/udp

COPY config /root/samples
COPY run.sh run.sh

ENV DOMAIN jitsi.example.com
ENV YOURSECRET1 jitsi
ENV YOURSECRET2 jitsi
ENV YOURSECRET3 jitsi

VOLUME /keys
VOLUME /recordings

ENTRYPOINT ./run.sh
