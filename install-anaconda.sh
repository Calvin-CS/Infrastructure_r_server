#!/bin/bash

export ANACONDA_VER=2022.10
export ANACONDA_DOWNLOAD_URL=https://repo.anaconda.com/archive
export ANACONDA_PATH=/export/anaconda

# download and install base anaconda
curl -o anaconda.sh $ANACONDA_DOWNLOAD_URL/Anaconda3-$ANACONDA_VER-Linux-x86_64.sh 
bash anaconda.sh -b -p $ANACONDA_PATH -u
rm -rf anaconda.sh

# setup condarc file
CONDARC=$ANACONDA_PATH/.condarc
if [ ! -f "$CONDARC" ]; then
	cp .condarc $ANACONDA_PATH/
fi

# add additional packages into anaconda
cd $ANACONDA_PATH
export PATH=${ANACONDA_PATH}/bin:$PATH
conda install -y mamba
/usr/bin/yes | mamba install fastai \
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
	tensorflow \
	streamlit \
	plotly \
	pydeck \
	html5lib \
	xlwt \
	xlrd \
	XlsxWriter \
	openpyxl \
	lxml \
	pandas \
	beautifulsoup4 \
	colorama \
	pytest \
	flask \
	matplotlib \
	scipy \
	pillow \
	requests \
	fastcore \
	sentencepiece
pip install gmplot \
        numpy \
	guizero \
	gpiozero \
	pgzero \
	pygame \
       	birdseye \
	odfpy
pip install jupyter \
	jupyterlab \
	rsp_jupyter \
	rsconnect_jupyter \
	rsconnect_python \
	workbench_jupyterlab
#pip install ryp2
/usr/bin/yes | conda clean -a

# enable jupyer extensions
/export/anaconda/bin/jupyter-nbextension install --sys-prefix --py rsp_jupyter
/export/anaconda/bin/jupyter-nbextension enable --sys-prefix --py rsp_jupyter
/export/anaconda/bin/jupyter-nbextension install --sys-prefix --py rsconnect_jupyter
/export/anaconda/bin/jupyter-nbextension enable --sys-prefix --py rsconnect_jupyter
/export/anaconda/bin/jupyter-serverextension enable --sys-prefix --py rsconnect_jupyter
