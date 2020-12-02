FROM python:3.8

RUN apt-get update && \
    apt-get install -y software-properties-common \
    libsecp256k1-dev

WORKDIR code

COPY requirements.txt ./
COPY setup.py ./
RUN pip install -r requirements.txt

COPY . .

RUN pip install .
RUN pip install git+https://github.com/aleph-im/aleph-client.git@1016413ad8ba006e6b6afa8306aee64f8a2dec4e

CMD python -m poolmonitor.commands --end-height 11252483