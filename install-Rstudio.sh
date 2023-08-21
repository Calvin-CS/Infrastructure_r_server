#!/bin/bash

# install Rstudio
# daily version: 2022.07.2-564.pro1
#export RSW_VERSION=2022.07.1-554.pro3
#export RSW_VERSION=2022.07.2-576.pro12
#export RSW_VERSION=2022.12.0-353.pro20
export RSW_VERSION=2023.06.1-524.pro1
export RSW_NAME=rstudio-workbench
export RSW_DOWNLOAD_URL=https://download2.rstudio.org/server/focal/amd64

#export RSW_VERSION_URL=`echo -n "${RSW_VERSION}" | sed 's/+/-/g'`
#curl -O ${RSW_DOWNLOAD_URL}/${RSW_NAME}-${RSW_VERSION_URL}-amd64.deb
echo "Downloading ${RSW_DOWNLOAD_URL}/${RSW_NAME}-${RSW_VERSION}-amd64.deb"
curl -O ${RSW_DOWNLOAD_URL}/${RSW_NAME}-${RSW_VERSION}-amd64.deb
gdebi -n ${RSW_NAME}-${RSW_VERSION}-amd64.deb
rm ${RSW_NAME}-${RSW_VERSION}-amd64.deb
apt autoremove -y
apt clean
rm -f /var/lib/rstudio-server/r-versions

# drop conf files
if test -f r-versions; then
	cp -f r-versions /var/lib/rstudio-server/
	cp -f r-versions /etc/rstudio/
fi
if test -f rsession-profile; then
	cp -f rsession-profile /etc/rstudio/
fi
