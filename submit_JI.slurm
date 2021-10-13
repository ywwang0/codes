#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=64
#SBATCH --partition=cpu
#SBATCH --output=vasp.out
#SBATCH --error=vasp.error

ulimit -s unlimited
ulimit -l unlimited

module load intel/16.0.2-gcc-4.8.5 intel-mpi/5.1.3.223-gcc-4.8.5 intel-mkl/11.3.3.210-gcc-4.8.5
module load vasp

export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so

srun vasp_std
