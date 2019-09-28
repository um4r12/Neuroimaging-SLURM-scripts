

# Sample SLURM script for dcm2niix #

# $DCM2NIIXROOT - location of the installation of dcm2niix #
	# ex.) /home/mukhan/dcm2niix/build/bin/dcm2niix #

# $PROJECTDIR - location of the project directory containing subject folders # 
	# ex.) /home/mukhan/scratch/pipelines/dcm2niix/projects/CALSNIC_2_V1/inputFiles/CAL/Extracted/ #
       	
# $SUBJECTDIR - name of the subject folder containing sorted DCM files (each scan in separate folder) #
	# ex.) CAL001_420523_V1 #

# dcm2niix -h
	# usage: dcm2niix [options] <in_folder>
	# Options :
	#  -1..-9 : gz compression level (1=fastest..9=smallest, default 6)
	#  -b : BIDS sidecar (y/n/o [o=only: no NIfTI], default y)
	#   -ba : anonymize BIDS (y/n, default y)
	#  -c : comment stored in NIfTI aux_file (up to 24 characters)
	#  -d : directory search depth. Convert DICOMs in sub-folders of in_folder? (0..9, default 5)
	#  -f : filename (%a=antenna (coil) name, %b=basename, %c=comments, %d=description, %e=echo number, %f=folder name, %i=ID of patient, %j=seriesInstanceUID, %k=studyInstanceUID, %m=manufacturer, %n=name of patient, %p=protocol, %r=instance number, %s=series number, %t=time, %u=acquisition number, %v=vendor, %x=study ID; %z=sequence name; default '%f_%p_%t_%s')
	#  -g : generate defaults file (y/n/o/i [o=only: reset and write defaults; i=ignore: reset defaults], default n)
	#  -h : show help
	#  -i : ignore derived, localizer and 2D images (y/n, default n)
	#  -l : losslessly scale 16-bit integers to use dynamic range (y/n, default n)
	#  -m : merge 2D slices from same series regardless of study time, echo, coil, orientation, etc. (y/n, default n)
	#  -n : only convert this series number - can be used up to 16 times (default convert all)
	#  -o : output directory (omit to save to input folder)
	#  -p : Philips precise float (not display) scaling (y/n, default y)
	#  -r : rename instead of convert DICOMs (y/n, default n)
	#  -s : single file mode, do not convert other images in folder (y/n, default n)
	#  -t : text notes includes private patient details (y/n, default n)
	#  -u : up-to-date check
	#  -v : verbose (n/y or 0/1/2 [no, yes, logorrheic], default 0)
	#  -x : crop (y/n, default n)
	#  -z : gz compress images (y/i/n/3, default n) [y=pigz, i=internal:miniz, n=no, 3=no,3D]
	# Defaults file : /home/mukhan/.dcm2nii.ini
	# Examples :
	#  dcm2niix /Users/chris/dir
	#  dcm2niix -c "my comment" /Users/chris/dir
	#  dcm2niix -o /users/cr/outdir/ -z y ~/dicomdir
	#  dcm2niix -f %p_%s -b y -ba n ~/dicomdir
	#  dcm2niix -f mystudy%s ~/dicomdir
	#  dcm2niix -o "~/dir with spaces/dir" ~/dicomdir	
