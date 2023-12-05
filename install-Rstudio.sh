#!/bin/bash

# install Rstudio
# daily version: 2022.07.2-564.pro1
#export RSW_VERSION=2022.07.1-554.pro3
#export RSW_VERSION=2022.07.2-576.pro12
#export RSW_VERSION=2022.12.0-353.pro20
export RSW_VERSION=2023.09.1
export RSW_NAME=rstudio-workbench
export RSW_DOWNLOAD_URL=https://download2.rstudio.org/server/focal/amd64

#export RSW_VERSION_URL=`echo -n "${RSW_VERSION}" | sed 's/+/-/g'`
#curl -O ${RSW_DOWNLOAD_URL}/${RSW_NAME}-${RSW_VERSION_URL}-amd64.deb
echo "Downloading ${RSW_DOWNLOAD_URL}/${RSW_NAME}-${RSW_VERSION}-amd64.deb"
curl -O ${RSW_DOWNLOAD_URL}/${RSW_NAME}-${RSW_VERSION}-amd64.deb

# check if the file downloaded
if test -f ${RSW_NAME}-${RSW_VERSION}-amd64.deb; then

	# if the server is already installed; suspend and offline it
	if test -f /usr/sbin/rstudio-server; then
		/usr/sbin/rstudio-server suspend-all
		/usr/sbin/rstudio-server offline
		gdebi -n ${RSW_NAME}-${RSW_VERSION}-amd64.deb
		/usr/sbin/rstudio-server restart
		/usr/sbin/rstudio-server online

	# otherwise, just install it
	else
		gdebi -n ${RSW_NAME}-${RSW_VERSION}-amd64.deb
	fi
fi

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
