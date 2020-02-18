#!/bin/bash -l

#SBATCH -J MyLongJob
#SBATCH -N 1
#SBATCH --ntasks-per-node=2
#SBATCH --time=120:00:00
#SBATCH -p gpu

module load lang/R

for i in Adipo_Prism_Output_*
do
  name=$(echo $i | cut -d "_" -f 4)
  echo $i
  echo $name
  sbatch ./Run_PerturbCluster_Rowwise_copy.sh $i
  #oarsub -l nodes=1/core=1,walltime=110 -p "cputype='xeon-haswell'" -n "OCILY7_$name" -S "./Run_PerturbCluster_Rowwise_copy.sh $i"
done
