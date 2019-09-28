#!/bin/bash

#SBATCH --time=12:00:00
#SBATCH --mem=2000M
#SBATCH --job-name=$SUBJECTIDIR_dcm2niix
#SBATCH --output=$SUBJECTDIR_dcm2niix

echo "Current working directory is `pwd`"
echo "Running on hostname `hostname`"

echo "Starting run at: `date`"


# definitions
#### $DCM2NIIXROOT - directory of dcm2niix installation
#### $PROJECTDIR - directory of the project containing subject folders
#### $SUBJECTDIR - specific subject directory containing unsorted/sorted DCM files

#### Note: $PROJECTDIR + $SUBJECTDIR define the directory that should be sorted. In my template, a project folder will contain a list of subject folders.
#### That is why the template is structured as above, but can be modified as desired.

# dcm2niix specific flags
#### -m y => merge 2D slices from same series regardless of study time, echo, coil, orientation, etc. (y/n, default n)
####  -f (%n_%p_%s) => nifti filename => patientName_protocol_seriesNumber ; for a full specification of dicom header tags, refer to `man dcm2niix` or https://www.dicomlibrary.com/dicom/dicom-tags/

$DCM2NIIXROOT -m y -f %n_%p_%s $PROJECTDIR/$SUBJECTDIR

wait

echo "Program dcm2niiix job finished with exit code $? at `date`"
