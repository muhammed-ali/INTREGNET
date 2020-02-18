#!/bin/bash -l

a='.hg19'
an='_Annotated.txt'
Annotated='/Annotated_5kb'
TF='/TF_Target_5kb'
txt='.txt'
targets='TFs_Targets_IDR.txt'

export LPIPFOLDER=$1

cd $1
pwd

#for i in *.hg19
#do
c=$(echo $i | cut -d "_" -f 1)
#echo "print current:$i"
#annotatePeaks.pl $i hg19 > $c$an
#done

#mkdir Annotated_5kb
#mv *_Annotated.txt $1$Annotated
cd $1$Annotated
#mkdir TF_Target_5kb

for i in *_Annotated.txt
do
  c=$(echo $i | cut -d "_" -f 1)
  Rscript /home/users/mali/3_ChIPseq_idr_All_NearestTSS/Nearest_TSS_PeakProcessing.R $i $c $txt $1 $Annotated $TF
done

cd $1$Annotated$TF
Rscript /home/users/mali/3_ChIPseq_idr_All_NearestTSS/Nearest_TSS_TFTargets.R $1 $Annotated $TF $targets
