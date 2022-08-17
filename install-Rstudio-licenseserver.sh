#!/bin/bash

# install Rstudio license server
export RSW_NAME=rsp-license-server
export RSW_VERSION=1.1.2
export RSW_DOWNLOAD_URL=https://s3.amazonaws.com/rstudio-license-server

#https://s3.amazonaws.com/rstudio-license-server/rsp-license-server-1.1.2-x86_64.deb

curl -O ${RSW_DOWNLOAD_URL}/${RSW_NAME}-${RSW_VERSION}-x86_64.deb
gdebi -n ${RSW_NAME}-${RSW_VERSION}-x86_64.deb
#rm ${RSW_NAME}-${RSW_VERSION}-x86_64.deb
apt autoremove -y
apt clean
