#! /bin/sh

#set -e
#set -v

#. /data/data01/tpmd/quarantine-1.9.15/minc-toolkit-config.sh

#PREFIX=$(pwd)

#export PATH=$PREFIX/nist_mni_pipelines:$PATH
#export PYTHONPATH=$PREFIX/nist_mni_pipelines:$PYTHONPATH
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=1

python -m scoop -n 32 \
   ./nist_mni_pipelines/ipl_segmentation_library_prepare.py \
   --output  cv_t1_den     \
   --library cb_nlm_t1_den \
   --cv      cv_t1_den.json \
   --options seg_options_den.json

 
