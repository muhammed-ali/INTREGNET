#!/bin/bash -l

#SBATCH -J MyLongJob
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --time=120:00:00
#SBATCH -p gpu

#module load lang/R
# module load lang/R/3.4.4-foss-2018a-X11-20180131-bare
# export R_LIBS_USER="$HOME/R/foss-2018a/3.4.4"

module load swenv/default-env/devel
module load lang/R

name=$(echo $1 | cut -d "_" -f 4)
echo $name

Rscript PerturbCluster_Rowwise_batch.R $name
