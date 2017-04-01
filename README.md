# nheqminer for macOS

### Build instructions

**NOTE: Common mistake is to clone this repo without recursive, you need to use --recursive**

`$ git clone --recursive https://github.com/kozyilmaz/nheqminer-macos.git`  
`$ cd nheqminer-macos`  
`$ source environment`  
`$ make`

Two binaries will be created under `miner` directory  
**NOTE: NVIDIA CUDA Toolkit 8.0 (from https://developer.nvidia.com/cuda-downloads) should be installed to build nheqminer-gpu**

```
nheqminer-cpu (only CPU, SSE2 and AVX)[USE_CPU_TROMP, USE_CPU_XENONCAT]  
nheqminer-gpu (CPU & GPU, AVX and CUDA)[USE_CPU_XENONCAT, USE_CUDA_DJEZO]
```

### Run instructions

```Parameters: 
    -h		Print this help and quit
    -l [location]	Stratum server:port
    -u [username]	Username (bitcoinaddress)
    -a [port]	Local API port (default: 0 = do not bind)
    -d [level]	Debug print level (0 = print all, 5 = fatal only, default: 2)
    -b [hashes]	Run in benchmark mode (default: 200 iterations)

CPU settings
    -t [num_thrds]	Number of CPU threads
    -e [ext]	Force CPU ext (0 = SSE2, 1 = AVX, 2 = AVX2)

NVIDIA CUDA settings
    -ci		CUDA info
    -cv [ver]	Set CUDA solver (0 = djeZo, 1 = tromp)
    -cd [devices]	Enable CUDA mining on spec. devices
    -cb [blocks]	Number of blocks
    -ct [tpb]	Number of threads per block
Example: -cd 0 2 -cb 12 16 -ct 64 128
```

### Simple CPU benchmarking
`./nheqminer -b -t 2`


### Simple GPU benchmarking
**NOTE: GPU miner depends on CUDA capable graphics card with "Compute Capability" > 5.0 and CUDA driver for MAC (/usr/local/cuda/lib/libcuda.dylib)**
`./nheqminer -b -cd 0`


### Command line invocation for mining
`./nheqminer <cpu-mining-args> <gpu-mining-args> -l <server:port> -u <wallet-address>.<worker>`


## Donations

If you feel this project is useful to you. Feel free to donate.

    BTC address: 1GmXRm5sEATy3Kz1hCxS1dwfXuCPkevsa
    ZEC address:
    