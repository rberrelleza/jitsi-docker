Jitsi Docker Container
======================

To build: `docker build -t jitsi .`

To run, with self-signed certs:

`docker run -it -p 80:80 -p 443:443 -p 10000-20000:10000-20000 --net=host -e "DOMAIN=yourdns.example.com" -e "YOURSECRET1=YOURSECRET1" -e "YOURSECRET2=YOURSECRET2" -e "YOURSECRET3=YOURSECRET3" jisi`

To run, with valid signed certs:

- Copy the .key and .crt to a local folder
- `docker run -it -p 80:80 -p 443:443 -p 10000-20000:10000-20000 --net=host -e "DOMAIN=yourdns.example.com" -e "YOURSECRET1=YOURSECRET1" -e "YOURSECRET2=YOURSECRET2" -e "YOURSECRET3=YOURSECRET3" --volume $(pwd)/keys:/keys:ro jitsi`
