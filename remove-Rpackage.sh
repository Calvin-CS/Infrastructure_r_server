#!/bin/bash

ORIGPATH=$PATH

# check for package argument
if [ -n "$1" ]; then
  for dir in /opt/R/*; do
    Rver="$(basename -- $dir)"
    if [[ $Rver == 'lost+found' || $Rver == 'R' ]]; then
      echo "Skipping directory named $Rver"
    else
      echo "Updating $Rver"
      export PATH=$ORIGPATH:/opt/R/${Rver}/bin
      /opt/R/${Rver}/bin/Rscript Rremove.R $1
    fi
  done
else
  echo "No packagename given as argument."
fi
