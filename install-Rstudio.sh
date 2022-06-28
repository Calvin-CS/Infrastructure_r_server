#!/bin/bash

# install Rstudio
export RSW_VERSION=2022.02.2+485.pro2
export RSW_NAME=rstudio-workbench
export RWS_DOWNLOAD_URL=https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64

apt update --fix-missing
export RWS_VERSION_URL=`echo -n "${RSW_VERSION}" | sed 's/+/-/g'`
curl -o rstudio-workbench.deb ${RSW_DOWNLOAD_URL}/${RSW_NAME}-${RSW_VERSION_URL}-amd64.deb
gdebi -n rstudio-workbench.deb
rm rstudio-workbench.deb
apt autoremove -y
apt clean
rm -rf /var/lib/rstudio-server/r-versions
