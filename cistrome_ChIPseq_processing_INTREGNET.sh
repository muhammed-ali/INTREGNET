#!/bin/bash -l
module load compiler/GCC

# bedtools sort -i ./ChIP_Atlas_Cistrom.bed > ChIP_Atlas_Cistrom.bedx
awk '!seen[$0]++' ChIP_Atlas_Cistrom.bedx > ChIP_Atlas_Cistrom.bed
echo "done"
