#! /bin/bash

mkdir log

for i in {nihpd,icbm}_native/*_*_*_t1w_defaced.mnc;do
d=$(dirname $i)
s=$(basename $i|cut -d -f _ -f 1,2)
v=$(basename $i|cut -d -f _ -f 3)

sbatch -o log/${s}_${v}.log <<END
#! /bin/bash
#
./preprocess_data.sh $s $v $d proc/
END

done
