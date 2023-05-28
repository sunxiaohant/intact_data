#!/bin/bash
#SBATCH --job-name=94       # Job name
#SBATCH --nodes=1                     # 申请节点数为1
#SBATCH --ntasks=1                    # 提交任务数
#SBATCH --partition=wggc3             # 指定提交分区
#SBATCH --cpus-per-task=6             # 每个任务所需要的核心数，默认为1
#SBATCH --mem=5gb                     # 内存申请
#SBATCH --time=120:00:00
#SBATCH --nodelist=wheat[4]
#SBATCH --output=slurm94.out            # Standard output
#SBATCH --error=slurm94.error           # Standard error

#source /data3/user3/sunxh/anaconda/etc/profile.d/conda.sh
#conda activate motif



#python get_TSS_near_bed.py > TSS_near_sequence.bed
#
#bedtools getfasta -fi /data/user/chenym/genomeData/IWGSC-v2.1/part/IWGSCv2p1.fa -bed motif/tf1_TSS.txt -name -s -fo promter1.fa

streme --verbosity 1 --oc ./motif/com/HSF --dna --totallength 4000000 --time 14400 --minw 8 --maxw 15 --thresh 0.05 --align center --p motif/HSF/promter_94.fa
