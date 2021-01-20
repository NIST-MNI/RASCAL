#! /bin/bash

export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=1

python -m scoop -n 32 \
   ./nist_mni_pipelines/ipl_segmentation_library_prepare.py \
   --output  cv_t1     \
   --library cb_nlm_t1 \
   --cv      cv_t1.json \
   --options rascal_seg_options.json

