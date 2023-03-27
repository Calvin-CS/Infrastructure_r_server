#!/bin/bash

# install cmdstan dependencies
apt install build-essential

# download cmdstan (via github)
#export CMDSTAN_VERSION=2.31.0
cd /tmp
git clone https://github.com/stan-dev/cmdstan.git --depth=1 --recursive 
#wget https://github.com/stan-dev/cmdstan/releases/download/v${CMDSTAN_VERSION}/cmdstan-${CMDSTAN_VERSION}.tar.gz
#tar zxfv cmdstan-${CMDSTAN_VERSION}.tar.gz

# build for linux
#cd cmdstan-${CMDSTAN_VERSION}
cd cmdstan
make build -j4

# copy everything to /usr/local; first remove old version
rm -rf /usr/local/cmdstan
cd /tmp
#mv cmdstan-${CMDSTAN_VERSION} cmdstan
mv cmdstan /usr/local/

# fixup permissions; apparently these directories need to be writable by the user /sigh
chmod 0777 /usr/local/cmdstan
#find /usr/local/cmdstan -type f -exec chmod 0666 {} \;
find /usr/local/cmdstan -type d -exec chmod 0777 {} \;

# add to path
if [ ! -f /etc/profile.d/cmdstan.sh ]
then	
	echo '#!/bin/bash' > /etc/profile.d/cmdstan.sh
	echo 'export PATH=$PATH:/usr/local/cmdstan/bin' >> /etc/profile.d/cmdstan.sh
	echo 'export CMDSTAN=/usr/local/cmdstan' >> /etc/profile.d/cmdstan.sh
	chmod 0755 /etc/profile.d/cmdstan.sh
fi

# cleanup
#rm -f /tmp/cmdstan-${CMDSTAN_VERSION}.tar.gz
