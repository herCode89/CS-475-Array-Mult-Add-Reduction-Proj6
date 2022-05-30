#!/bin/bash
#SBATCH  -J  RecordAll
#SBATCH  -A  cs475-575
#SBATCH  -p  class
#SBATCH  --gres=gpu:1
#SBATCH  -o  RecordAll.out
#SBATCH  -e  RecordAll.err
#SBATCH  --mail-type=BEGIN,END,FAIL
#SBATCH  --mail-user=herbertf@oregonstate.edu



#Multiply

for d in 1 4 16 64 256 1024 4096
do
    for s in 8 16 32 64 128 256 512
    do
        g++ -o ArrayMult ArrayMult.cpp /usr/local/apps/cuda/cuda-10.1/lib64/libOpenCL.so.1.1 -DNMB=$d -DLOCAL_SIZE=$s -lm -fopenmp
        ./ArrayMult
    done
done



#MultiplyAdd

for d in 1 4 16 64 256 1024 4096
do
    for s in 8 16 32 64 128 256 512
    do
        g++ -o ArrayMultAdd ArrayMultAdd.cpp /usr/local/apps/cuda/cuda-10.1/lib64/libOpenCL.so.1.1 -DNMB=$d -DLOCAL_SIZE=$s -lm -fopenmp
        ./ArrayMultAdd
    done
done

#MultuplyReduction

for d in 1 4 16 64 256 1024 4096
do
    for s in 32 64 128 256
    do
        g++ -o ArrayMultReduction ArrayMultReduction.cpp /usr/local/apps/cuda/cuda-10.1/lib64/libOpenCL.so.1.1 -DNMB=$d -DLOCAL_SIZE=$s -lm -fopenmp
        ./ArrayMultReduction
    done
done