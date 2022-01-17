#!/bin/bash -l
#SBATCH -A snic2017-7-343
#SBATCH -p core -n 8
#SBATCH -t 4:30:00
##SBATCH  --qos=short
##SBATCH -t 2:00
#SBATCH -J mappingpotato
#SBATCH -o /proj/snic2021-23-431/nobackup/slurm/process_%j.out
#SBATCH -e /proj/snic2021-23-431/nobackup/slurm/process_%j.err
#SBATCH --mail-user=ashfaq.ali@immun.lth.se
#SBATCH --mail-type=END

## The alignmet took less that two hours for each sample, the time can be reduced
module load bioinfo-tools star/2.5.3a


f1="/proj/snic2021-23-431/private/data/rawdata_cp/Sample_TK-2780-Saprodi-W2d-R3/"*R1_001.fastq.gz
f2="/proj/snic2021-23-431/private/data/rawdata_cp/Sample_TK-2780-Saprodi-W2d-R3/"*R2_001.fastq.gz
#ls $f1

#STAR --genomeDir /proj/snic2021-23-431/private/reference/potatogenome/ --readFilesIn "/proj/snic2021-23-431/private/data/rawdata/$f/\*R1_001.fastq.gz" /proj/snic2021-23-431/private/data/rawdata/$f/*R2_001.fastq.gz --runThreadN 8 --readFilesCommand zcat --outFileNamePrefix /proj/snic2021-23-431/nobackup/aligned/$f. --outTmpDir /proj/snic2021-23-431/nobackup/aligned/tmp
mkdir /proj/snic2021-23-431/nobackup/aligned/Sample_TK-2780-Saprodi-W2d-R3/

STAR --genomeDir /proj/snic2021-23-431/private/reference/potatogenome/ --readFilesIn $f1 $f2 --runThreadN 8 --readFilesCommand zcat --outFileNamePrefix /proj/snic2021-23-431/nobackup/aligned/Sample_TK-2780-Saprodi-W2d-R3/ --outSAMtype BAM SortedByCoordinate --outFilterScoreMinOverLread 0.25 --outFilterMatchNminOverLread 0.25 --outFilterMismatchNmax 2 

#STAR --genomeDir /proj/snic2021-23-431/private/reference/potatogenome/ --readFilesIn /proj/snic2021-23-431/private/data/rawdata/$f/*R1_001.fastq.gz /proj/snic2021-23-431/private/data/rawdata/$f/*R2_001.fastq.gz --runThreadN 8 --readFilesCommand zcat --outFileNamePrefix /proj/snic2021-23-431/nobackup/aligned/$f.
