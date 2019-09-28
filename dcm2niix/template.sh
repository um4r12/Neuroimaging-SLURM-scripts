#!/bin/bash

#SBATCH --time=12:00:00
#SBATCH --mem=2000M
#SBATCH --job-name=$SUBJECTIDIR_dcm2niix
#SBATCH --output=$SUBJECTDIR_dcm2niix

echo "Current working directory is `pwd`"
echo "Running on hostname `hostname`"

echo "Starting run at: `date`"

#  -m y => merge 2D slices from same series regardless of study time, echo, coil, orientation, etc. (y/n, default n)
#  -f (%n_%p_%s) => patientName_protocol_seriesNumber
$DCM2NIIXROOT $PROJECTDIR/$SUBJECTDIR -m y -f %n_%p_%s $PROJECTDIR/$SUBJECTDIR

wait

echo "Program dcm2niiix job finished with exit code $? at `date`"
