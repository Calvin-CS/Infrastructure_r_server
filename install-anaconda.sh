#!/bin/bash

export ANACONDA_VER=2023.07-0
export ANACONDA_DOWNLOAD_URL=https://repo.anaconda.com/archive
export ANACONDA_PATH=/export/anaconda

# download and install base anaconda
wget -O anaconda.sh $ANACONDA_DOWNLOAD_URL/Anaconda3-$ANACONDA_VER-Linux-x86_64.sh 
bash anaconda.sh -b -p $ANACONDA_PATH -u
rm -rf anaconda.sh

# setup condarc file
CONDARC=$ANACONDA_PATH/.condarc
if [ ! -f "$CONDARC" ]; then
	cp .condarc $ANACONDA_PATH/
else
	rm -f $ANACONDA_PATH/.condarc
	cp .condarc $ANACONDA_PATH/
fi

# add additional packages into anaconda
cd $ANACONDA_PATH
export PATH=${ANACONDA_PATH}/bin:$PATH
echo "**** Path set"
echo $PATH
echo "**** Install conda-libmamba-solver"
conda install -y conda-libmamba-solver --solver=classic
echo "**** Conda - install packages (mambasolver)"
conda install -y fastai \
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
echo "**** Pip - install packages"
# upgrade python tools
pip install --upgrade pip setuptools wheel

pip install gmplot \
	sentencepiece
pip install numpy \
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
	streamlit \
	plotly \
	pydeck \
	html5lib \
	odfpy \
	pexpect
pip install 'fastcore>1.3.26'
pip install altair \
	vega_datasets
pip install jupyter \
	jupyterlab \
	rsp_jupyter \
	rsconnect_jupyter \
	rsconnect_python \
	workbench_jupyterlab
pip install rpy2
# 2023-08-27 ken
pip install pins \
	orjson \
	vega_datasets
/usr/bin/yes | conda clean -a

# enable jupyer extensions
/export/anaconda/bin/jupyter-nbextension install --sys-prefix --py rsp_jupyter
/export/anaconda/bin/jupyter-nbextension enable --sys-prefix --py rsp_jupyter
/export/anaconda/bin/jupyter-nbextension install --sys-prefix --py rsconnect_jupyter
/export/anaconda/bin/jupyter-nbextension enable --sys-prefix --py rsconnect_jupyter
/export/anaconda/bin/jupyter-serverextension enable --sys-prefix --py rsconnect_jupyter

# pip jupyterlab extension
pip install workbench_jupyterlab
