# Build instructions:

`$ git clone --recursive https://github.com/kozyilmaz/nheqminer-macos.git`  
`$ source environment`  
`$ make`

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

### Simple benchmarking
`./nheqminer -b -t 2`

### Command line invocation for mining
`./nheqminer <cpu-mining-args> <gpu-mining-args> -l <server:port> -u <wallet-address>.<worker>`
