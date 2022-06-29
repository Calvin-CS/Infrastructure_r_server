#!/bin/bash

export ANACONDA_VER=2022.05
export ANACONDA_DOWNLOAD_URL=https://repo.anaconda.com/archive

# download and install base anaconda
curl -o anaconda.sh $ANACONDA_DOWNLOAD_URL/Anaconda3-$ANACONDA_VER-Linux-x86_64.sh 
bash anaconda.sh -b -p /opt/anaconda -u
rm -rf anaconda.sh

# setup condarc file
CONDARC=/opt/anaconda/.condarc
if [ ! -f "$CONDARC" ]; then
	cp ~/.condarc /opt/anaconda/
fi

# add additional packages into anaconda
cd /opt/anaconda
export PATH=/opt/anaconda/bin:$PATH
conda install -c conda-forge -y mamba
mamba install -c fastai -c pytorch -c conda-forge -y anaconda \
	fastai \
	fastbook \
	voila \
	jedi \
	pytorch \
	torchvision \
	torchaudio \
	cudatoolkit \
	folium \
	plotly \
	scikit-learn \
	matplotlib \
	pandas \
	anaconda-navigator \
	tensorflow 
pip install gmplot \
	sentencepiece
pip install 
	numpy \
	guizero \
	gpiozero \
	requests \
	pillow \
	scipy \
	matplotlib \
	pgzero \
	pygame \
	flask \
	pytest \
	colorama \
       	birdseye \
	beautifulsoup4 \
	pandas \
	lxml \
	openpyxl \
	XlsxWriter \
	xlrd \
	xlwt \
	html5lib \
	odfpy
pip install 'fastcore>1.3.26'
pip install jupyter \
	jupyerlab \
	rsp_jupyter \
	rsconnect_jupyter \
	rsconnect_python
conda clean -a

# enable jupyer extensions
/opt/anaconda/bin/jupyter-nbextension install --sys-prefix --py rsp_jupyter
/opt/anaconda/bin/jupyter-nbextension enable --sys-prefix --py rsp_jupyter
/opt/anaconda/bin/jupyter-nbextension install --sys-prefix --py rsconnect_jupyter
/opt/anaconda/bin/jupyter-nbextension enable --sys-prefix --py rsconnect_jupyter
/opt/anaconda/bin/jupyter-serverextension enable --sys-prefix --py rsconnect_jupyter
