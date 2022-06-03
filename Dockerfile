FROM debian:bullseye

ADD assets/genesis.json /tmp/genesis.json

ADD script/install.sh /tmp/install.sh

ADD script/entrypoint.sh /bsc/local/entrypoint.sh

ADD script/console /usr/local/bin

ENV NETWORK_ID=1000
ENV BSC_LOCAL_DIR=/bsc/local
ENV HTTP_PORT=8545
ENV WS_PORT=8546
ENV NODE_NAME=node1

WORKDIR /bsc/local

RUN chmod +x /bsc/local/entrypoint.sh && chmod +x /tmp/install.sh && chmod +x /usr/local/bin/console && /tmp/install.sh

CMD ["/bsc/local/entrypoint.sh"]