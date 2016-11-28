# !/bin/bash

if [ -f /root/.first-boot ]; then

  mkdir /root/.sip-communicator
  cp /root/samples/sip-communicator.properties /root/.sip-communicator/sip-communicator.properties

  cp /root/samples/prosody.cfg.lua /etc/prosody/conf.avail/$DOMAIN.cfg.lua
  sed -i "s/jitsi.example.com/$DOMAIN/g" /etc/prosody/conf.avail/$DOMAIN.cfg.lua
  sed -i "s/YOURSECRET1/$YOURSECRET1/g" /etc/prosody/conf.avail/$DOMAIN.cfg.lua
  sed -i "s/YOURSECRET2/$YOURSECRET2/g" /etc/prosody/conf.avail/$DOMAIN.cfg.lua
  rm /etc/prosody/conf.d/*
  ln -s /etc/prosody/conf.avail/$DOMAIN.cfg.lua /etc/prosody/conf.d/$DOMAIN.cfg.lua

  # This could be overriden via a volume
  if [ ! -f /keys/$DOMAIN.key ]; then
    echo 'Generating a self signed certificate'
    openssl req -new -x509 -days 365 -nodes -subj "/C=US/ST=CA/L=San Francisco/O=Jitsi/CN=$DOMAIN" -out "/keys/$DOMAIN.crt" -newkey rsa:2048 -keyout "/keys/$DOMAIN.key"
  else
    echo 'Using existing certificates'
  fi

  prosodyctl register focus auth.$DOMAIN $YOURSECRET3

  cp /root/samples/nginx.conf /etc/nginx/sites-available/$DOMAIN
  sed -i "s/jitsi.example.com/$DOMAIN/g" /etc/nginx/sites-available/$DOMAIN
  rm /etc/nginx/sites-enabled/*
  ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled/$DOMAIN


  sed -i "/^JVB_HOST=/s/=.*/=$DOMAIN/g" /etc/jitsi/videobridge/config
  sed -i "/^JVB_HOSTNAME=/s/=.*/=$DOMAIN/g" /etc/jitsi/videobridge/config
  sed -i "/^JVB_SECRET=/s/=.*/=$YOURSECRET1/g" /etc/jitsi/videobridge/config

  sed -i "/^JICOFO_HOSTNAME=/s/=.*/=$DOMAIN/g" /etc/jitsi/jicofo/config
  sed -i "/^JICOFO_HOST=/s/=.*/=$DOMAIN/g" /etc/jitsi/jicofo/config
  sed -i "/^JICOFO_SECRET=/s/=.*/=$YOURSECRET2/g" /etc/jitsi/jicofo/config
  sed -i "/^JICOFO_AUTH_DOMAIN=/s/=.*/=auth\.$DOMAIN/g" /etc/jitsi/jicofo/config
  sed -i "/^JICOFO_AUTH_PASSWORD=/s/=.*/=$YOURSECRET3/g" /etc/jitsi/jicofo/config

  cp /root/samples/config.js /etc/jitsi/meet/$DOMAIN-config.js
  sed -i "s/jitsi.example.com/$DOMAIN/g" /etc/jitsi/meet/$DOMAIN-config.js

  echo "127.0.0.1   $DOMAIN" >> /etc/hosts

  rm /root/.first-boot
fi

prosodyctl restart
/etc/init.d/jitsi-videobridge start
/etc/init.d/jicofo start
service nginx restart

tail -f /var/log/jitsi/jvb.log
