#!/bin/bash

# install VS Code server using rstudio-server installers
# note that they removed the dedicated command to do this, so I have to rsync
# it from where it is installed to the NFS mount in /opt/code-server
#rstudio-server install-vs-code /opt/code-server
cd /usr/lib/rstudio-server/bin
rsync -av --delete code-server /opt/
cd /opt/code-server/
ln -s ./bin/code-server code-server
ln -s ./lib/node node

# copy conf files
cp -f vscode.conf /etc/rstudio/
cp -f vscode-user-settings.json /etc/rstudio/
