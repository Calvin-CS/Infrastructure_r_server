#!/bin/bash

export MINICONDA_VERSION=py39_4.11.0
export PYTHON_VERSION=3.9.12
export MINICONDA_DOWNLOAD_URL=https://repo.anaconda.com/miniconda

# install Python via miniconda
curl -o miniconda.sh $MINICONDA_DOWNLOAD_URL/Miniconda3-$MINICONDA_VERSION-Linux-x86_64.sh
bash miniconda.sh -bp /opt/python/$PYTHON_VERSION
/opt/python/$PYTHON_VERSION/bin/conda install -y python==$PYTHON_VERSION
rm -rf miniconda.sh

# install and enable jupyter and appropriate notebook extensions
export PATH=/opt/python/$PYTHON_VERSION/bin:$PATH
/opt/python/$PYTHON_VERSION/bin/pip install jupyter jupyterlab rsp_jupyter rsconnect_jupyter rsconnect_python workbench_jupyterlab sklearn pandas
/opt/python/$PYTHON_VERSION/bin/jupyter-nbextension install --sys-prefix --py rsp_jupyter 
/opt/python/$PYTHON_VERSION/bin/jupyter-nbextension enable --sys-prefix --py rsp_jupyter 
/opt/python/$PYTHON_VERSION/bin/jupyter-nbextension install --sys-prefix --py rsconnect_jupyter 
/opt/python/$PYTHON_VERSION/bin/jupyter-nbextension enable --sys-prefix --py rsconnect_jupyter 
/opt/python/$PYTHON_VERSION/bin/jupyter-serverextension enable --sys-prefix --py rsconnect_jupyter
