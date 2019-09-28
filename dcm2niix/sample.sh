#!/bin/bash
#SBATCH --time=12:00:00
#SBATCH --mem=2000M
#SBATCH --job-name=CAL001_420523_V1_dcm2nii
#SBATCH --output=CAL001_420523_V1_dcm2nii

cd /home/mukhan/scratch/pipelines/dcm2niix/projects/CALSNIC_2_V1/inputFiles/CAL/Extracted/CAL001_420523_V1

echo "Current working directory is `pwd`"
echo "Running on hostname `hostname`"

echo "Starting run at: `date`"

/home/mukhan/dcm2niix/build/bin/dcm2niix -m y -f %n_%p_%s /home/mukhan/scratch/pipelines/dcm2niix/projects/CALSNIC_2_V1/inputFiles/CAL/Extracted/CAL001_420523_V1

wait

echo "Program freesufer job finished with exit code $? at `date`"
