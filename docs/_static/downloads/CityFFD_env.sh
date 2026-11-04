#!/usr/bin/env bash

export NVHPC_ROOT=/path/to/hpc_sdk/Linux_x86_64/23.9
export COMPILER_ROOT=$NVHPC_ROOT/compilers
export MPI_ROOT=$NVHPC_ROOT/comm_libs/openmpi/openmpi-4.1.5
export CUDA_ROOT=$NVHPC_ROOT/cuda/12.2
export NCCL_ROOT=$NVHPC_ROOT/comm_libs/nccl

export TECIO_ROOT=/path/to/TECIO
export HDF5_ROOT=/path/to/hdf5

export PATH="$COMPILER_ROOT/bin:$MPI_ROOT/bin${PATH:+:$PATH}"

export LD_LIBRARY_PATH="$MPI_ROOT/lib"
export LD_LIBRARY_PATH="$COMPILER_ROOT/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$TECIO_ROOT/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$CNPY_ROOT/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$HDF5_ROOT/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$CUDA_ROOT/lib64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$NCCL_ROOT/lib:$LD_LIBRARY_PATH"
