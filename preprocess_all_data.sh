#! /bin/bash

mkdir -p log
mkdir -p library
ref=/data/data01/models/icbm152_ext55_model_sym/mni_icbm152_t1_tal_nlin_sym_55_ext_mask.mnc

for i in {nihpd,icbm}_native/*_*_*_t1w_defaced.mnc;do
d=$(dirname $i)
s=$(basename $i|cut -d _ -f 1,2)
ss=$(basename $i|cut -d _ -f 2)
v=$(basename $i|cut -d _ -f 3)

cohort=${d/_native}

cd=${d/_native/_corr}

if [[ "$cohort" == "nihpd" ]];then
n=$(sqlite3 ../../../bic/NIHPD/obj1/id2id.sqlite3 "select dccid from id2id2 where pid=$ss")
xfm_t1w=${cd}/stx_${n}_${v}.xfm
seg=nihpd/stx_ext_${n}_${v}_cer.mnc
else # ICBM
xfm_t1w=${cd}/tal_xfm_${ss}_V1_t1w.xfm
seg=icbm/tal_ext_${ss}_V1_cer.mnc
fi

xfm_t2w_t1w=proc/${s}/${v}/clp/xfm_t2w_${s}_${v}.xfm

t1w=proc/${s}/${v}/clp/clamp_${s}_${v}_t1w.mnc
t2w=proc/${s}/${v}/clp/clamp_${s}_${v}_t2w.mnc
pdw=proc/${s}/${v}/clp/clamp_${s}_${v}_pdw.mnc

sbatch -o log/${s}_${v}.log <<END
#! /bin/bash
#
./preprocess_data.sh $s $v $d proc/

# use t1w,t2w,pdw from proc, but apply transformation from {nihpd,icbm}_corr
itk_resample --like $ref --order 2 $t1w library/${s}_${v}_t1w.mnc --transform $xfm_t1w
cp $xfm_t1w library/${s}_${v}_t1w.xfm

xfmconcat $xfm_t2w_t1w $xfm_t1w library/${s}_${v}_t2w.xfm
itk_resample --like $ref --order 2 $t2w library/${s}_${v}_t2w.mnc --transform library/${s}_${v}_t2w.xfm

cp library/${s}_${v}_t2w.xfm library/${s}_${v}_pdw.xfm
itk_resample --like $ref --order 2 $pdw library/${s}_${v}_pdw.mnc --transform library/${s}_${v}_pdw.xfm

# warp segmentaton
#itk_resample --like $ref --order 1 --baa $seg library/${s}_${v}_cb.mnc --labels --short 
mincresample -short -labels -nearest  $seg library/${s}_${v}_cb.mnc -like $ref

END

done
