#!/bin/sh

# cpu
# while true; do ./nheqminer-cpu -l eu1-zcash.flypool.org:3333 -u WALLET_ADDRESS.WORKER_NAME -t 4; echo "sleep & restart"; sleep 30; done
# while true; do ./nheqminer-cpu -l zec.suprnova.cc:2142 -u WORKER_NAME -p WORKER_PASS -t 4; echo "sleep & restart"; sleep 30; done
# while true; do ./nheqminer-cpu -l equihash.eu.nicehash.com:3357 -u BITCOIN_ADDRESS.worker1 -t 14; echo "sleep & restart"; sleep 30; done

# gpu
# while true; do ./nheqminer-gpu -l eu1-zcash.flypool.org:3333 -u WALLET_ADDRESS.WORKER_NAME -cd 0; echo "sleep & restart"; sleep 30; done

# old
# while true; do ./nheqminer-old -l eu1-zcash.flypool.org:3333 -u WALLET_ADDRESS.WORKER_NAME -cd 0; echo "sleep & restart"; sleep 30; done
