#!/bin/bash

# install R package dependencies
xargs apt install -y < Rpackages-jammy.dep

# install R
export R_VERSION=4.3.2
curl -O https://cdn.rstudio.com/r/ubuntu-2204/pkgs/r-${R_VERSION}_1_amd64.deb
gdebi -n r-${R_VERSION}_1_amd64.deb
rm -rf r-${R_VERSION}_1_amd64.deb

# install R packages
export PATH=/opt/R/${R_VERSION}/bin:$PATH
Rscript Rpackages.R

# overwrite r-versions
cp -f r-versions /etc/rstudio/
cp -f r-versions /var/lib/rstudio-server/
