#!/bin/bash -l
for f in `cat /proj/snic2021-23-431/private/data/rawdata_cp/files`; do
    perl -pe "s/TEST/$f/g" align_reads_3_sort.sh > testsort.sh
    #bash test.sh
    sbatch testsort.sh
done
