#!/bin/bash
source config.sh

for (( n=0; n<=65; n++))
do
  number=$(( $n + 1))
  numberstr="0${number}"
  numberstr=${numberstr: -2};
  mv "${translation}/${bookarray[$n]}/" "${translation}/${numberstr} - ${bookarray[$n]}/";
done;
