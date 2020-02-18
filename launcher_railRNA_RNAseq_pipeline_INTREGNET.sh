#!/bin/bash

cd /scratch/users/mali/manifest_files

for i in *.manifest
do
  name=$(echo $i | cut -d "." -f 1)
  mkdir /scratch/users/mali/railRNA_out/${name}
  #cp $i /scratch/users/mali/railRNA_out/${name}
  oarsub -l core=12,walltime=120 -p "cputype='xeon-haswell'" -n "${name}.railRNA" -S "./railRNA_script.sh $i $name"
done

