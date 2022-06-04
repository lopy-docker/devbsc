#!/bin/bash


#  init node named node1
# 可以加一个if

geth --datadir ${BSC_LOCAL_DIR}/${NODE_NAME} --networkid ${NETWORK_ID} \
  --http --http.addr=0.0.0.0 --http.port=${HTTP_PORT} \
  --ws --ws.addr=0.0.0.0 --ws.port=${WS_PORT}