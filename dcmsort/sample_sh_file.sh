#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --mem=4000M
#SBATCH --job-name=sort_dicom_Calgary_C004_month0
#SBATCH --output=sort_dicom_Calgary_C004_month0.out

export PATH=/home/mukhan/project/mukhan/software/dcmtk/dcmtk-gcc-7.3.0/bin/:"$PATH"
export DCMDICTPATH=/home/mukhan/project/mukhan/software/dcmtk/dcmtk-3.6.4/dcmdata/data/dicom.dic


cd /home/mukhan/scratch/temp/calsnic-1/raw_mri_extracted/Calgary_Users_Groups/C004/Calgary_C004_month0/scans

echo "Current working directory is `pwd`"
echo "Running on hostname `hostname`"

echo "Starting run at: `date`"

for file in *.dcm; do 

	seriesDescription=`dcmdump ${file} +P "0008,103E" | cut -d "[" -f2 | cut -d "]" -f1 | tr " /" "_"`;
        seriesNumber=`dcmdump ${file} +P "0020,0011"| cut -d "[" -f2 | cut -d "]" -f1 | tr " /" "_"`;

	if [ ! -d ${seriesDescription}_${seriesNumber} ]; then 
		echo "mkdir: ${seriesDescription}_${seriesNumber}";
		mkdir "${seriesDescription}_${seriesNumber}";
	fi;

		
	echo "mv ${file} ${seriesDescription}_${seriesNumber}/";
	mv "${file}" "${seriesDescription}_${seriesNumber}/";
done

wait

echo "Program sort_dicom finished with exit code $? at `date`"
