#!/bin/bash

# install VS Code server using rstudio-server installers
rstudio-server install-vs-code /opt/code-server

# copy conf files
cp -f vscode.conf /etc/rstudio/
cp -f vscode-user-settings.json /etc/rstudio/
