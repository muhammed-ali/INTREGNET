#!/bin/bash -l

#SBATCH -J MyLongJob
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --time=3-00:00:00
#SBATCH -p gpu

module load swenv/default-env/devel
module load lang/R/3.6.0-foss-2019a-bare
module load base/MATLAB


cd /home/users/mali/Tasks/core_networks/net_oct_2019

Rscript pipeline_cluster.R $1

# sh ./code_v2_clus.sh $1

# Rscript GenerateNetworks_Cluster.R $1
# echo"networks created"

# Rscript ConvertNetworkToModelChecking.R $1
# echo "model checking done"

# Rscript WriteProperties.R $1
# echo "properties written"

# cd /home/users/mali/Tasks/core_networks/net_oct_2019/$1/

# /home/users/mali/Tasks/core_networks/Evan_networks/PRISM/prism-4.4-linux64/bin/prism -v ./"$1_Network_Prism_v1.txt" ./"$1_Reward.txt" > "/home/users/mali/Tasks/core_networks/net_oct_2019/$1/$1_Prism_Output"
# echo "PRISM output file created"
pwd
