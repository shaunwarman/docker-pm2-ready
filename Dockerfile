FROM mhart/alpine-node:8

MAINTAINER Shaun Warman

WORKDIR /tmp/node

COPY . .

# install pm2 and setup folder structure
RUN npm install -g pm2 \
    && mkdir -p /home/cronusapp/.pm2/logs \
    && mkdir -p /home/cronusapp/.pm2/pids \
    && cd /home/cronusapp/.pm2 \
    && touch pm2.log \
             pm2.pid \
             rpc.sock \
             pub.sock \
             conf.js \
             module_conf.json \
    && chmod -R 775 /home/cronusapp/.pm2

WORKDIR /tmp/node/app

CMD pm2-docker start ecosystem.json
