#!/bin/bash
# One-time setup of DEBIAN build folders

# Note: folder mounts here reflect this running on aznfs

mkdir -p /root/deb-build /export
cd /root/deb-build
mkdir -p csanaconda/opt/anaconda csanaconda/DEBIAN
ln -s /root/deb-build/csanaconda/opt/anaconda /export/anaconda
mkdir -p cspython/opt/python cspython/DEBIAN
ln -s /root/deb-build/cspython/opt/python /export/python
mkdir -p csr/opt/R csr/DEBIAN
ln -s /root/deb-build/csr/opt/R /export/R
