# nheqminer : CPU & GPU miner for macOS

This repository builds standalone `nheqminer` binaries for macOS platform without installing brew.  
No additional dependency required, all tools (`autotools, cmake etc.`) and libraries (`boost`) are compiled from scratch.  
Two flavours of nheqminer (`SSE2 and AVX`, `AVX and CUDA`) are built using `llvm-g++` with minimal binary dependency.

### Build instructions

`$ git clone https://github.com/kozyilmaz/nheqminer-macos.git`  
`$ cd nheqminer-macos`  
`$ source environment`  
`$ make`

Two binaries will be created under `miner` directory  

```
nheqminer-cpu (only CPU, SSE2 and AVX)[USE_CPU_TROMP, USE_CPU_XENONCAT]  
nheqminer-gpu (CPU & GPU >= SM 5.0, AVX and CUDA)[USE_CPU_XENONCAT, USE_CUDA_DJEZO]  
```
**IMPORTANT NOTE:**  
**NVIDIA CUDA Toolkit 8.0 or 9.0 (from https://developer.nvidia.com/cuda-downloads) should be installed**  
**CUDA compatible 'Command Line Tools macOS 10.12 for Xcode 8.2' (for CUDA 8.0) or 'Command Line Tools macOS 10.12 for Xcode 8.3.2' (for CUDA 9.0) is needed (from https://developer.apple.com/download/more/)**  
**nheqminer-gpu depends on CUDA capable graphics card with "Compute Capability" >= 5.0, for older ("Compute Capability" >= 3.0) cards use nheqminer-old**  

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
`./nheqminer-cpu -b -t 2`  

### Simple GPU benchmarking
`./nheqminer-gpu -b -cd 0`  
`./nheqminer-old -b -cd 0`  

### Command line invocation for mining
`./nheqminer-xxx -l <server:port> -u <wallet-address>.<worker> <cpu-mining-args> <gpu-mining-args>`

## Thanks

Original authors of `nheqminer`

## Donations

If you feel this project is useful to you. Feel free to donate.

    BTC address: 1GmXRm5sEATy3Kz1hCxS1dwfXuCPkevsa
    ZEC address: t1MW8Vx4SF1ewmL3rTN8UfRxULFTaugh1ab

