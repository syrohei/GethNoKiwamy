#!/bin/bash -x

# Generate and store a wallet password
if [ ! -f ~/.accountpassword ]; then
  echo `date +%s | sha256sum | base64 | head -c 32` > ~/.accountpassword
fi

if [ ! -f ~/.primaryaccount ]; then
  geth --testnet --password ~/.accountpassword account new > ~/.primaryaccount
fi

geth --verbosity 5 --testnet  --nat "any" --maxpeers 100 --password ~/.accountpassword --unlock 0  --rpc --rpcapi eth,net,web3,personal,admin,miner --rpcaddr "0.0.0.0" --rpccorsdomain "*" --targetgaslimit 1710647284
