Release
=======
nheqminer-cpu (only CPU, SSE2 and AVX)[USE_CPU_TROMP, USE_CPU_XENONCAT]
nheqminer-gpu (CPU & GPU >= SM 5.0, AVX and CUDA)[USE_CPU_XENONCAT, USE_CUDA_DJEZO]
nheqminer-old (older GPU's >= SM 3.0 & < SM 5.0, AVX and CUDA)[USE_CPU_XENONCAT, USE_CUDA_DJEZO]

NOTE: nheqminer-gpu depends on CUDA capable graphics card with "Compute Capability" >= 5.0 and CUDA driver for MAC (/usr/local/cuda/lib/libcuda.dylib)
NOTE: nheqminer-old depends on CUDA capable graphics card with "Compute Capability" >= 3.0 and CUDA driver for MAC (/usr/local/cuda/lib/libcuda.dylib)

Usage
=====
Simple benchmarks:
$ ./nheqminer-cpu -b -t 2
$ ./nheqminer-gpu -b -cd 0
$ ./nheqminer-old -b -cd 0

Mining examples:
$ ./nheqminer-cpu -l equihash.eu.nicehash.com:3357 -u BITCOIN_ADDRESS.worker1 -t 6
$ ./nheqminer-cpu -l zec.suprnova.cc:2142 -u WORKER_NAME -p WORKER_PASSWORD -t 6
$ ./nheqminer-gpu -l eu1-zcash.flypool.org:3333 -u ZCASH_ADDRESS.worker1 -cd 0
$ ./nheqminer-old -l eu1-zcash.flypool.org:3333 -u ZCASH_ADDRESS.worker1 -cd 0

Changelog
=========
v5
==
* initial CUDA 9.0 support added
* nheqminer-old using a patched Djezo CUDA solver tuned for > SM 3.0

v4
==
* same software as v3
* nheqminer-old added, using Tromp CUDA solver for older GPU's

v3
==
* nheqminer-0.5c
* "macOS 10.12.5" (16F73)
* "CUDA Toolkit 8.0.61" from https://developer.nvidia.com/cuda-downloads
* "Command Line Tools (macOS 10.12) for XCode 8.2" from https://developer.apple.com/download/more/

v0.1
====
* nheqminer-0.5c
* "macOS 10.12.4" (16E195)
* "CUDA Toolkit 8.0.61" from https://developer.nvidia.com/cuda-downloads
* "CUDA 8.0.71 driver for MAC" from http://www.nvidia.com/object/mac-driver-archive.html
* "Command Line Tools (macOS 10.12) for XCode 8.2" from https://developer.apple.com/download/more/

