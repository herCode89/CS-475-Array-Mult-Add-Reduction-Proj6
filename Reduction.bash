#!/bin/bash
#SBATCH  -J  ArrayMultReduction
#SBATCH  -A  cs475-575
#SBATCH  -p  class
#SBATCH  --gres=gpu:1
#SBATCH  -o  ArrayMultReduction.out
#SBATCH  -e  ArrayMultReduction.err
#SBATCH  --mail-type=BEGIN,END,FAIL
#SBATCH  --mail-user=herbertf@oregonstate.edu

#MultuplyReduction

for d in 1 4 16 64 256 1024 4096
do
    for s in 32 64 128 256
    do
        g++ -o ArrayMultReduction ArrayMultReduction.cpp /usr/local/apps/cuda/cuda-10.1/lib64/libOpenCL.so.1.1 -DNMB=$d -DLOCAL_SIZE=$s -lm -fopenmp
        ./ArrayMultReduction
    done
done