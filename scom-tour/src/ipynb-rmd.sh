#!/bin/bash

#file path
fp=$1

#convert 
if [[ $fp == *.ipynb ]]; then
#file name
fn=$(basename "$fp" .ipynb)
#
echo "converting ipynb to R ..."
#ipynb to Rmd
echo "rmarkdown:::convert_ipynb('"$fp"', output=xfun::with_ext('"$fp"', 'Rmd'))" | R --slave
echo "Rmd written to src/ ..."
#Rmd to R
echo "knitr::purl('src/"$fn".Rmd', output='src/"$fn".R')" | R --slave
echo "R written to src/ ..."

elif [[ $fp == *.R ]]; then
#file name
fn=$(basename "$fp" .R)
#
echo "converting R to ipynb ..."
#R to Rmd
echo "knitr::spin('"$fp"', knit=FALSE)" | R --slave
echo "Rmd written to src/ ..."
#Rmd to ipynb
jupytext --to notebook src/"$fn".Rmd
echo "ipynb written to src/ ..."

else
echo "file type error ... $fp"
fi
