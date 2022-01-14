#!/bin/bash
#SBATCH -A snic2021-22-481
#SBATCH -p node -N 1 -C mem256GB
##SBATCH -n 20
#SBATCH -t 24:00:00
#SBATCH -J create_bam
#SBATCH -o process_%j.out
#SBATCH -e process_%j.err
#SBATCH --mail-user=ashfaq.ali@immun.lth.se
#SBATCH --mail-type=END

cd /proj/snic2021-23-431/private/Dvid/

module load bioinfo-tools
module load cellranger/3.0.1

#Ashfaq made some changes below.

cellranger count --id='TC2_new' --fastqs='./dvid/TC2_fastq/'  --sample='sample_2' --transcriptome='$CELLRANGER_DATA/'refdata-cellranger-GRCh38-3.0.0 --localcores=20 --localmem=256

