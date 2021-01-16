#! /bin/bash

s=$1
v=$2
p=$3
o=$4

if [[ -z $o ]];then
echo "Usage: $0 <scan id> <output_prefix>"
exit 1
fi
set -e

mkdir -p $o

# reference for standard ICBM152 space
#ref_std=/home/vfonov/models/icbm152_model_09c/mni_icbm152_t1_tal_nlin_sym_09c_mask.mnc

export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=1
export export OMP_NUM_THREADS=1


python nist_mni_pipelines/ipl_preprocess_pipeline.py \
  --options preprocess_pipeline_options.json \
  --output $o \
  $s $v \
  ${p}${s}_${v}_t1w_defaced.mnc \
  ${p}${s}_${v}_t2w_defaced.mnc \
  ${p}${s}_${v}_pdw_defaced.mnc 
