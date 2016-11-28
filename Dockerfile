FROM ubuntu:trusty
MAINTAINER rberrelleza@atlassian.com

ENV DEBIAN_FRONTEND noninteractive

ARG JITSI="1.0.1073-1"
ARG VIDEOBRIDGE="751-1"
ARG JICOFO="1.0-267-1"

RUN apt-get update -y && \
  apt-get install -y software-properties-common && \
  add-apt-repository ppa:openjdk-r/ppa && \
  apt-get update -y && \
  apt-get install -y wget openjdk-8-jre-headless nginx prosody luarocks default-jre-headless

RUN  cd /tmp && \
  wget -q https://download.jitsi.org/jitsi/debian/jitsi-videobridge_${VIDEOBRIDGE}_amd64.deb && \
  dpkg -i jitsi-videobridge_${VIDEOBRIDGE}_amd64.deb && \
  wget -q https://download.jitsi.org/jitsi/debian/jicofo_${JICOFO}_amd64.deb && \
  dpkg -i jicofo_${JICOFO}_amd64.deb && \
  wget -q https://download.jitsi.org/jitsi/debian/jitsi-meet-prosody_${JITSI}_all.deb && \
  dpkg -i jitsi-meet-prosody_${JITSI}_all.deb && \
  wget -q https://download.jitsi.org/jitsi/debian/jitsi-meet_${JITSI}_all.deb && \
  dpkg -i jitsi-meet_${JITSI}_all.deb

RUN mkdir /root/samples && \
  mkdir /var/run/prosody && \
  chown prosody /var/run/prosody && \
  touch /root/.first-boot

COPY config /root/samples
COPY run.sh run.sh

ENV DOMAIN hipchat-video.example.com
ENV YOURSECRET1 hipchat
ENV YOURSECRET2 hipchat
ENV YOURSECRET3 hipchat

EXPOSE 80 443
EXPOSE 10000-20000/udp

ENTRYPOINT ./run.sh
