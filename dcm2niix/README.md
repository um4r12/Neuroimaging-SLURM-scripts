# Sample SLURM script for dcm2niix

This README covers an example of a SLURM script that can be used to submit a `dcm2niix` job. 

## Template

```bash
#!/bin/bash

# define a set of slurm options (ex. max job execution time, amount of memory job requires, job name, and job log)
#SBATCH --time=12:00:00
#SBATCH --mem=2000M
#SBATCH --job-name=$SUBJECTIDIR_dcm2niix
#SBATCH --output=$SUBJECTDIR_dcm2niix

echo "Current working directory is `pwd`"
echo "Running on hostname `hostname`"

echo "Starting run at: `date`"

#  -m y => merge 2D slices from same series regardless of study time, echo, coil, orientation, etc. (y/n, default n)
#  -f (%n_%p_%s) => patientName_protocol_seriesNumber
$DCM2NIIXROOT -m y -f %n_%p_%s $PROJECTDIR/$SUBJECTDIR

wait

echo "Program dcm2niiix job finished with exit code $? at `date`"
```

**_$DCM2NIIXROOT_** →  directory of  dcm2niix installation 

i.e.) `/home/mukhan/dcm2niix/build/bin/dcm2niix`

**_$PROJECTDIR_** →  directory  of the project  containing subject folders 

i.e.) `/home/mukhan/scratch/pipelines/dcm2niix/projects/CALSNIC_2_V1/inputFiles/CAL/Extracted/`

**_$SUBJECTDIR_** →  specific subject directory containing unsorted/sorted DCM files

i.e.) `CAL001_420523_V1`

_Note_: **$PROJECTDIR** + **$SUBJECTDIR**  define the directory that should be sorted. In my template, a project folder will contain a list of subject folders. That is why the template is structured as above, but can be modified as desired.

## Sample
```bash
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
```

## dcm2niix

```bash
Chris Rorden's dcm2niiX version v1.0.20181125  GCC5.4.0 (64-bit Linux)
usage: dcm2niix [options] <in_folder>
 Options :
  -1..-9 : gz compression level (1=fastest..9=smallest, default 6)
  -b : BIDS sidecar (y/n/o [o=only: no NIfTI], default y)
   -ba : anonymize BIDS (y/n, default y)
  -c : comment stored in NIfTI aux_file (up to 24 characters)
  -d : directory search depth. Convert DICOMs in sub-folders of in_folder? (0..9, default 5)
  -f : filename (%a=antenna (coil) name, %b=basename, %c=comments, %d=description, %e=echo number, %f=folder name, %i=ID of patient, %j=seriesInstanceUID, %k=studyInstanceUID, %m=manufacturer, %n=name of patient, %p=protocol, %r=instance number, %s=series number, %t=time, %u=acquisition number, %v=vendor, %x=study ID; %z=sequence name; default '%f_%p_%t_%s')
  -g : generate defaults file (y/n/o/i [o=only: reset and write defaults; i=ignore: reset defaults], default n)
  -h : show help
  -i : ignore derived, localizer and 2D images (y/n, default n)
  -l : losslessly scale 16-bit integers to use dynamic range (y/n, default n)
  -m : merge 2D slices from same series regardless of study time, echo, coil, orientation, etc. (y/n, default n)
  -n : only convert this series number - can be used up to 16 times (default convert all)
  -o : output directory (omit to save to input folder)
  -p : Philips precise float (not display) scaling (y/n, default y)
  -r : rename instead of convert DICOMs (y/n, default n)
  -s : single file mode, do not convert other images in folder (y/n, default n)
  -t : text notes includes private patient details (y/n, default n)
  -u : up-to-date check
  -v : verbose (n/y or 0/1/2 [no, yes, logorrheic], default 0)
  -x : crop (y/n, default n)
  -z : gz compress images (y/i/n/3, default n) [y=pigz, i=internal:miniz, n=no, 3=no,3D]
 Defaults file : /home/mukhan/.dcm2nii.ini
 Examples :
  dcm2niix /Users/chris/dir
  dcm2niix -c "my comment" /Users/chris/dir
  dcm2niix -o /users/cr/outdir/ -z y ~/dicomdir
  dcm2niix -f %p_%s -b y -ba n ~/dicomdir
  dcm2niix -f mystudy%s ~/dicomdir
  dcm2niix -o "~/dir with spaces/dir" ~/dicomdir
Example output filename: '/myFolder_MPRAGE_19770703150928_1.nii'
```


