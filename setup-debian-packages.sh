#!/bin/bash
# One-time setup of DEBIAN build folders

# Note: folder mounts here reflect this running on aznfs

mkdir -p /root/deb-build
cd /root/deb-build
mkdir -p csanaconda/opt/anaconda csanaconda/DEBIAN
mount --bind /export/anaconda csanaconda/opt/anaconda
mkdir -p cspython/opt/python cspython/DEBIAN
mount --bind /export/python cspython/opt/python
mkdir -p csr/opt/R csr/DEBIAN
mount --bind /export/r csr/opt/R
