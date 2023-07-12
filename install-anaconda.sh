#!/bin/bash

export ANACONDA_VER=2023.07
export ANACONDA_DOWNLOAD_URL=https://repo.anaconda.com/archive
export ANACONDA_PATH=/export/anaconda
#export MAMBAFORGE_DOWNLOAD_URL=https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
#export MAMBAFORGE_DOWNLOAD_URL=https://github.com/conda-forge/miniforge/releases/download/4.14.0-2/Mambaforge-4.14.0-2-Linux-x86_64.sh
#export MAMBAFORGE_DOWNLOAD_URL=https://github.com/conda-forge/miniforge/releases/download/4.13.0-1/Mambaforge-4.13.0-1-Linux-x86_64.sh

# download and install mambaforge
#wget -O mambaforge.sh $MAMBAFORGE_DOWNLOAD_URL
#bash mambaforge.sh -b -p $ANACONDA_PATH -u
#rm -rf mambaforge.sh

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
echo "**** Install mamba"
conda install -y mamba -n base -c conda-forge
#echo "Mamba - install Anaconda"
#/usr/bin/yes | mamba install anaconda
echo "**** Mamba - install packages"
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
	tensorflow 
echo "**** Pip - install packages"
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
pip install jupyter \
	jupyterlab \
	rsp_jupyter \
	rsconnect_jupyter \
	rsconnect_python \
	workbench_jupyterlab
pip install ryp2
/usr/bin/yes | conda clean -a

# enable jupyer extensions
/export/anaconda/bin/jupyter-nbextension install --sys-prefix --py rsp_jupyter
/export/anaconda/bin/jupyter-nbextension enable --sys-prefix --py rsp_jupyter
/export/anaconda/bin/jupyter-nbextension install --sys-prefix --py rsconnect_jupyter
/export/anaconda/bin/jupyter-nbextension enable --sys-prefix --py rsconnect_jupyter
/export/anaconda/bin/jupyter-serverextension enable --sys-prefix --py rsconnect_jupyter
