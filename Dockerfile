FROM ubuntu:trusty
MAINTAINER rberrelleza@atlassian.com

ENV DEBIAN_FRONTEND noninteractive

RUN echo 'deb http://download.jitsi.org/nightly/deb unstable/' >> /etc/apt/sources.list && \
  apt-get install -y wget && \
  wget -qO - https://download.jitsi.org/nightly/deb/unstable/archive.key | apt-key add - && \
  apt-get update && \
  apt-get -y install jitsi-meet prosody && \
  apt-get clean && \
  mkdir /root/samples && \
  mkdir /var/run/prosody && \
  chown prosody /var/run/prosody && \
  touch /root/.first-boot

EXPOSE 80 443
EXPOSE 10000-20000/udp

COPY config /root/samples
COPY run.sh run.sh

ENV DOMAIN hipchat-video.example.com
ENV YOURSECRET1 hipchat
ENV YOURSECRET2 hipchat
ENV YOURSECRET3 hipchat

VOLUME /var/lib/prosody/

ENTRYPOINT ./run.sh
