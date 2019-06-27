# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

RUN pip install --upgrade bs4

# Install Tensorflow
RUN conda install --quiet --yes \
    'tensorflow=1.13*' \
    'nltk' \ 
    'keras=2.2*' && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
