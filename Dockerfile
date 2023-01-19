FROM nvidia/cuda:10.0-base as base_image
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-get update && apt-get install -y wget bzip2 git
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN bash miniconda.sh -b -p /opt/conda && \
    rm miniconda.sh
ENV PATH="/opt/conda/bin:${PATH}"
RUN conda config --set always_yes yes
RUN conda install python=3.7

RUN conda install pytorch=1.2.0 cuda100 torchvision -c pytorch
RUN conda install -c menpo opencv
RUN pip install tensorboardX scikit-image tqdm pyyaml easydict future

RUN git clone https://github.com/valeoai/ADVENT.git
RUN pip install -e ./ADVENT

COPY ./ ./DADA
RUN pip install -e ./DADA

RUN pip install pyyaml==5.4.1

WORKDIR ./DADA