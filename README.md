# nheqminer for macOS

### Build instructions

**NOTE: Common mistake is to clone this repo without recursive, you need to use --recursive**

`$ git clone --recursive https://github.com/kozyilmaz/nheqminer-macos.git`  
`$ cd nheqminer-macos`  
`$ source environment`  
`$ make`

Two binaries will be created under `miner` directory  
`nheqminer-cpu`  
  - USE_CPU_TROMP
  - USE_CPU_XENONCAT

`nheqminer-gpu`
  - USE_CPU_XENONCAT
  - USE_CUDA_DJEZO

### Precompiled binaries created using
- macOS 10.12.4 (16E195)
- [CUDA Toolkit 8.0.61](https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_mac-dmg) from https://developer.nvidia.com/cuda-downloads
- [CUDA 8.0.71 driver for MAC](http://www.nvidia.com/object/macosx-cuda-8.0.71-driver.html) from http://www.nvidia.com/object/mac-driver-archive.html
- [Command Line Tools (macOS 10.12) for XCode 8.2](http://adcdownload.apple.com/Developer_Tools/Command_Line_Tools_macOS_10.12_for_Xcode_8.2/Command_Line_Tools_macOS_10.12_for_Xcode_8.2.dmg) from https://developer.apple.com/download/more/


### Enabled solvers
  - USE_CPU_TROMP (Y)
  - USE_CPU_XENONCAT (Y)
  - USE_CUDA_TROMP (N)
  - USE_CUDA_DJEZO (N)

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

### Command line invocation for mining
`./nheqminer <cpu-mining-args> <gpu-mining-args> -l <server:port> -u <wallet-address>.<worker>`



## Donations

If you feel this project is useful to you. Feel free to donate.

    BTC address: 1GmXRm5sEATy3Kz1hCxS1dwfXuCPkevsa
    ZEC address:
    