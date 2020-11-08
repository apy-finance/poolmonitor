FROM python:3.8

SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common \
    libsecp256k1-dev

WORKDIR code
COPY . .

RUN pip install .
RUN pip install git+https://github.com/aleph-im/aleph-client.git@1016413ad8ba006e6b6afa8306aee64f8a2dec4e



# locale / text encodings
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8


CMD python -m poolmonitor.commands
