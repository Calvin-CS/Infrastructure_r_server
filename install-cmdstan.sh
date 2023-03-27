#!/bin/bash

# install cmdstan dependencies
apt install build-essential

# download cmdstan
export CMDSTAN_VERSION=2.31.0
cd /tmp
wget https://github.com/stan-dev/cmdstan/releases/download/v${CMDSTAN_VERSION}/cmdstan-${CMDSTAN_VERSION}.tar.gz
tar zxfv cmdstan-${CMDSTAN_VERSION}.tar.gz

# build for linux
cd cmdstan-${CMDSTAN_VERSION}
make build

# copy everything to /usr/local; first remove old version
rm -rf /usr/local/cmdstan
cd /tmp
mv cmdstan-${CMDSTAN_VERSION} cmdstan
mv cmdstan /usr/local/

# add to path
if [ ! -f /etc/profile.d/cmdstan.sh ]
then	
	echo '#!/bin/bash' > /etc/profile.d/cmdstan.sh
	echo 'export PATH=$PATH:/usr/local/cmdstan/bin' >> /etc/profile.d/cmdstan.sh
	echo 'export CMDSTAN=/usr/local/cmdstan' >> /etc/profile.d/cmdstan.sh
	chmod 0755 /etc/profile.d/cmdstan.sh
fi

# cleanup
rm -f /tmp/cmdstan-${CMDSTAN_VERSION}.tar.gz
