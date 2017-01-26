#!/bin/tcsh
# Does embedded reestimation
# of monophone models obtained
# after HRest
# Input argument: Number of iterations (reestimation)
# Author: Rupak Vignesh

set HMM=/Users/RupakVignesh/Desktop/7100/Lyrics-to-Audio-Alignment/Timit_Acoustic_Model
set iter = 0
set total_iter = $1
mkdir -p hmm_with_er/hmm0 
cp hmm/hmmdefs hmm_with_er/hmm0/

while($iter < $total_iter)
    set next_iter = `expr $iter + 1`
    mkdir -p hmm_with_er/hmm$next_iter 
    HERest -C $HMM/Configs/config-init -t 250.0 150.0 5000.0 -T 1 -I words.mlf -S $HMM/lists/mfclist_formatted.train -H $HMM/hmm_with_er/hmm$iter/hmmdefs -M $HMM/hmm_with_er/hmm$next_iter $HMM/lists/phonelist
    @ iter++
end