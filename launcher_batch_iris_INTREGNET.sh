#!/bin/bash -l

cd /home/users/mali/Tasks/core_networks/net_oct_2019

for i in *.tsv
do
  name=$(echo $i | cut -d "_" -f 1)
  mkdir /home/users/mali/Tasks/core_networks/net_oct_2019/${name} # make directory same as the cell type name
  cp $i /home/users/mali/Tasks/core_networks/net_oct_2019/${name} # copy raw_TPM.tsv file to newly made directory
  #cd /work/users/mali/Tasks/core_networks/tissue_cl/${name}
  sh ./jobRun_iris.sh "$name"
done

