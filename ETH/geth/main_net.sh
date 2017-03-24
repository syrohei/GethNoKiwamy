#!/bin/bash -x

# Generate and store a wallet password
if [ ! -f ~/.accountpassword ]; then
  echo `date +%s | sha256sum | base64 | head -c 32` > ~/.accountpassword
fi

if [ ! -f ~/.primaryaccount ]; then
  geth  --password ~/.accountpassword account new > ~/.primaryaccount
fi

geth --fast  --verbosity 5 --nat "any" --maxpeers 100 --rpc --rpcapi eth,net,web3,personal,admin,miner --rpcaddr "localhost" --rpccorsdomain "*" 
