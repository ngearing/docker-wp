#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Setting up resolver dev file"
sudo mkdir -p /etc/resolver
echo "nameserver 127.0.0.1
port 53" | sudo tee /etc/resolver/dev

echo "Setting up proxy & dns services"
# docker network create reverse-proxy;
docker stop dnsmasq proxy;
docker rm dnsmasq proxy;

# docker-compose -f "$DIR"/proxy-compose.yml down
docker-compose -f "$DIR"/proxy-compose.yml up

# docker run -d \
#     --name dnsmasq \
#     --restart always \
#     -p 53535:53/tcp \
#     -p 53535:53/udp \
#     --cap-add NET_ADMIN \
#     --network reverse-proxy \
#     andyshinn/dnsmasq \
#     -A /dev/127.0.0.1 --log-facility=-;

# docker run -d \
#     --name proxy \
#     --restart always \
#     -p 80:80 \
#     -v /var/run/docker.sock:/tmp/docker.sock:ro \
#     --network reverse-proxy \
#     jwilder/nginx-proxy;
