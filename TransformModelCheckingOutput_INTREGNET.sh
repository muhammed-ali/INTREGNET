#!/bin/sh

#  TransformModelCheckingOutput.sh
#  
#
#  Created by Sascha ZICKENROTT on 03.09.18.
#
# $1 Path to Prism-output file

awk '/^[0123456789]+\:/' $1 > tmp.txt
sed -i  -r 's/[0-9]+\://g' tmp.txt
sed -i 's/Infinity/NA/g' tmp.txt
sed -i 's/(//g' tmp.txt
sed -i 's/)//g' tmp.txt
sed -i 's/=/    /g' tmp.txt
sed -i 's/,/    /g' tmp.txt
mv tmp.txt $1
