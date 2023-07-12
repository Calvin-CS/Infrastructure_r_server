#!/bin/bash

SCRIPT_DIR=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
DATETIME=`date +%Y%m%d%H%M`
#for PACKAGE in anaconda r python
for PACKAGE in anaconda
do
	# build the debian package
	cd $SCRIPT_DIR
	rm -f /root/deb-build/cs$PACKAGE/DEBIAN/control
	rm -f /root/deb-build/cs$PACKAGE*.deb
	cat deb-templates/cs$PACKAGE | sed s/%%DATETIME%%/$DATETIME/g > /root/deb-build/cs$PACKAGE/DEBIAN/control
	cd /root/deb-build/
	nice dpkg-deb -b cs$PACKAGE .

	# upload the package to cpscadmin
	ssh -lroot cpscadmin.cs.calvin.edu "rm -f /usr/local/repos/cpsc-ubuntu/dists/focal/main/packages/cs$PACKAGE*deb"
	scp cs$PACKAGE*deb root@cpscadmin.cs.calvin.edu:/usr/local/repos/cpsc-ubuntu/dists/focal/main/packages/

	# remove the package once built
	rm -f cs$PACKAGE*deb
done

# run the repo make script
ssh -lroot cpscadmin.cs.calvin.edu "/root/cpsc-repo-make-ubuntu-focal.sh"
