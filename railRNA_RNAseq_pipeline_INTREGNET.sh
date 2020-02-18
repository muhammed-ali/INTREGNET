#!/bin/bash

cd /scratch/users/mali/railRNA_out/$2

rail-rna go local -x /work/users/mali/Tasks/Indices/Homo_sapiens_NCBI_GRCh38/NCBI/GRCh38/Sequence/BowtieIndex/genome /work/users/mali/Tasks/Indices/Homo_sapiens_NCBI_GRCh38/NCBI/GRCh38/Sequence/Bowtie2Index/genome -m /scratch/users/mali/manifest_files/$1 --force

echo "Rail RNA pipeline is done"

cd /scratch/users/mali/railRNA_out/$2/rail-rna_out/coverage_bigwigs
pwd
# remove every file other than the right *.bw file
find . ! -name "$2.bw" -delete

# create Bwtools coverage outout 
sh /work/users/mali/newsoft/rail_rna/rail_rna_scripts/sum.sh /home/users/mali/.local/bin/bwtool /work/users/mali/newsoft/rail_rna/gencode_v25_annot/Gencode-v25.bed /scratch/users/mali/railRNA_out/$2/rail-rna_out/coverage_bigwigs/"$2.bw" /scratch/users/mali/railRNA_out/$2/

echo "BWTools coverage file is created"

cd /scratch/users/mali/railRNA_out/$2

Rscript /scratch/users/mali/railRNA_out/coverageToTPM.R $2
pwd
