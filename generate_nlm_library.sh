#! /bin/sh


export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=1

python -m scoop -n 32 \
   ./nist_mni_pipelines/iplScoopFusionSegmentation.py \
   --create cerebellum_vermis_half_t1.json \
   --output cb_nlm_t1
