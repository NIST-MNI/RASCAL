# Cerebellum segmentation library, version 20170817

This library includes scripts to generate cerebellum segmentation library
Based on the work done by Katrin Weier & Vladimir S. FONOV in 20170817


# Methods and Data

The method and segmentation library is explained in 
(Katrin Weier, Vladimir Fonov,  Karyne Lavoie, Julien Doyon, D. Louis Collins
"Rapid automatic segmentation of the human cerebellum and its lobules (RASCAL) 
Implementation and application of the patch‐based label‐fusion 
technique with a template library to segment the human cerebellum")[https://doi.org/10.1002/hbm.22529]
With additional corrections made by KW and improvements to the algorithm by VF.


## MRI Scans

Library contains 16 MRI datasets from ICBM project and 16 MRI datasets from NIHPD project. 
Each dataset contains T1w,T2w and PDw scan and manual segmentation of cerebellum lobules. 

## Label description

 - 101 : lobule_I_and_II_right
 - 103 : lobule_III_right
 - 105 : lobule_IV_right
 - 107 : lobule_V_right
 - 108 : lobule_VII_Af_right
 - 109 : lobule_VI_right
 - 113 : Crus_I_right
 - 115 : Crus_II_right
 - 116 : lobule_VII_At_right
 - 117 : lobule_VII_B_right
 - 119 : lobule_VIII_A_right
 - 121 : lobule_VIII_B_right
 - 123 : lobule_IX_right
 - 125 : lobule_X_right
 - 131 : lobule_I_and_II_left
 - 133 : lobule_III_left
 - 135 : lobule_IV_left
 - 136 : undefined
 - 137 : lobule_V_left
 - 138 : lobule_VII_Af_left
 - 139 : lobule_VI_left
 - 143 : Crus_I_left
 - 145 : Crus_II_left
 - 146 : lobule_VII_At_left
 - 147 : lobule_VII_B_left
 - 149 : lobule_VIII_A_left
 - 153 : lobule_IX_left
 - 155 : lobule_X_left
 - 171 : lobule_VIII_B_left
 - 200 : MC_peduncle_right
 - 201 : SC_peduncle_right
 - 210 : Vermis
 - 300 : MC_peduncle_left
 - 301 : SC_peduncle_left
 - 400 : white_matter_left
 - 500 : white_matter_right
