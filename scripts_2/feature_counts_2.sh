#!/bin/bash -l
#SBATCH -A snic2017-7-343
#SBATCH -p core -n 8
#SBATCH -t 24:00:00
#SBATCH -J countreads

module load bioinfo-tools htseq/0.9.1 samtools/1.9 gnuparallel/20180822 subread/1.5.2

#featureCounts -a /proj/snic2018-8-400/nobackup/reference/PGSC_DM_V403_representative_genes.gff -O -o /proj/snic2021-23-431/nobackup/counts/sample.counts -g Parent /proj/snic2021-23-431/nobackup/aligned/*/  -T 8

featureCounts -a "/proj/snic2018-8-400/nobackup/reference/PGSC_DM_V403_representative_genes.gff" -o "/proj/snic2021-23-431/nobackup/counts/counts.txt"  -g "Parent" -p -s 0 -T 8 /proj/snic2021-23-431/nobackup/aligned/*/*.bam
