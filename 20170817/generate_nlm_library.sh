#! /bin/sh


#. /data/data01/tpmd/quarantine-1.9.15/minc-toolkit-config.sh

#PREFIX=$(pwd)

#export PATH=$PREFIX/nist_mni_pipelines:$PATH
#export PYTHONPATH=$PREFIX/nist_mni_pipelines:$PYTHONPATH
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=1

python -m scoop -n 32 \
   ./nist_mni_pipelines/iplScoopFusionSegmentation.py \
   --create cerebellum_vermis_half_sc.json \
   --output library_vermis_half

