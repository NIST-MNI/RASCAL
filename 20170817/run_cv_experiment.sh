#! /bin/sh

set -e
set -v

. /data/data01/tpmd/quarantine-1.9.15/minc-toolkit-config.sh

PREFIX=$(pwd)

export PATH=$PREFIX/nist_mni_pipelines:$PATH
export PYTHONPATH=$PREFIX/nist_mni_pipelines:$PYTHONPATH
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=1

#if false ;then
python -m scoop -vvv -n 16 \
   $PREFIX/nist_mni_pipelines/iplScoopFusionSegmentation.py \
   --output  cv          \
   --segment library_vermis_half \
   --cv      cv.json \
   --options seg_options.json
   
 
