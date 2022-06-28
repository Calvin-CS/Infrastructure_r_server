#!/bin/bash

export ANACONDA_VER=2022.05
export ANACONDA_DOWNLOAD_URL=https://repo.anaconda.com/archive
export PYTHON_VERSION=3.9.12

curl -o anaconda.sh $ANACONDA_DOWNLOAD_URL/Anaconda3-$ANACONDA_VER-Linux-x86_64.sh 
bash anaconda.sh -b -p /opt/anaconda -u
rm -rf anaconda.sh

cd /opt/anaconda
export PATH=/opt/anaconda/bin:$PATH
conda install -c conda-forge -y mamba
mamba install -c fastai -c pytorch -c conda-forge -y anaconda fastai jupyter fastbook voila jedi pytorch torchvision torchaudio cudatoolkit folium plotly scikit-learn matplotlib pandas anaconda-navigator jupyterlab tensorflow
pip install gmplot sentencepiece numpy guizero gpiozero requests pillow scipy matplotlib pgzero pygame flask pytest colorama birdseye beautifulsoup4 pandas lxml openpyxl XlsxWriter xlrd xlwt html5lib odfpy 'fastcore>1.3.26'
conda clean -a

CONDARC=/opt/anaconda/.condarc
if [ ! -f "$CONDARC" ]; then
	cp .condarc /opt/anaconda/
fi
