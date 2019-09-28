#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --mem=1000M
#SBATCH --job-name=UTA003_404799_V1_t1_mprage_sag_p2_iso1.0_5
#SBATCH --output=UTA003_404799_V1_t1_mprage_sag_p2_iso1.0_5.out
module load python/2.7
python /scratch/mukhan/software/n4_bias_correction.py /scratch/mukhan/pipelines/n4/projects/andrew_calsnic-2_V1_flair_t1_1.0/inputFiles/all/UTA003_404799_V1_t1_mprage_sag_p2_iso1.0_5.nii /scratch/mukhan/pipelines/n4/projects/andrew_calsnic-2_V1_flair_t1_1.0/outputFiles/all/bc_UTA003_404799_V1_t1_mprage_sag_p2_iso1.0_5.nii
