#!/bin/bash

# install Quarto 
export QUARTO_VERSION="1.2.269"
curl -O https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb
gdebi -n quarto-${QUARTO_VERSION}-linux-amd64.deb
rm -f quarto-${QUARTO_VERSION}-linux-amd64.deb

# add /usr/local/bin symlink
rm -f /usr/local/bin/quarto
ln -s /opt/quarto/${QUARTO_VERSION}/bin/quarto /usr/local/bin/quarto
