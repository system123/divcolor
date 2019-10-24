FROM  bvlc/caffe:gpu

RUN apt-get update && apt-get install -y \
  python-dev \
  python-pip \
  python-numpy \
  python-scipy \
  python-opencv

ENV CUDNN_REPO_PKG_V5 libcudnn5_5.1.10-1+cuda8.0_amd64.deb

RUN wget -q --show-progress http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/$CUDNN_REPO_PKG_V5
RUN dpkg -i $CUDNN_REPO_PKG_V5 && \
    apt-get update && apt-get install -y libcudnn5 && \
    rm $CUDNN_REPO_PKG_V5

RUN pip install --upgrade pip
RUN pip install scikit-learn
RUN pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.0.1-cp27-none-linux_x86_64.whl

ADD ./src /src/

WORKDIR /src

#ENTRYPOINT ["/bin/bash"]
