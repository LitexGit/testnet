#!/bin/sh


docker container run \
-p 10001:10009  \
-p 11001:9735  \
--rm \
--name alice \
--env NETWORK=testnet \
--env RPCUSER=kek \
--env RPCPASS=kek \
--env RPCHOST=18.179.206.91 \
--volume /home/litexdev/rpc:/rpc \
--volume /home/litexdev/lnd_nodes/node1:/root/.lnd \
llnd ./start-lnd.sh

