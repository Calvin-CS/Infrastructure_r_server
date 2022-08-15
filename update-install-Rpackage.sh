#!/bin/bash
ORIGPATH=$PATH
for dir in /opt/R/*; do
  Rver="$(basename -- $dir)"
  if [[ $Rver != 'lost+found' ]]; then
    echo "Updating $Rver"
    export PATH=$ORIGPATH:/opt/R/${Rver}/bin
    Rscript Rpackages.R
  fi
done
