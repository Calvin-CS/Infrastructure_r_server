#!/bin/bash

# install R package dependencies
xargs apt install -y < Rpackages.dep

# install R
#export CONNECT_VERSION=2022.11
#export CONNECT_VERSION=2024.06
export CONNECT_VERSION=2025.02
export CONNECT_SUBVERSION=0
curl -O https://cdn.rstudio.com/connect/${CONNECT_VERSION}/rstudio-connect_${CONNECT_VERSION}.${CONNECT_SUBVERSION}~ubuntu20_amd64.deb
gdebi -n rstudio-connect_${CONNECT_VERSION}.${CONNECT_SUBVERSION}~ubuntu20_amd64.deb
rm -rf rstudio-connect_${CONNECT_VERSION}.${CONNECT_SUBVERSION}~ubuntu20_amd64.deb
