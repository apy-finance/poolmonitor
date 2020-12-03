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

# end block is the start of week 2 rewards distribution:
# https://etherscan.io/tx/0xff47c063e80d51f20db39cebf1b03eb7655d6558f57f7fd0dd6aeaa11875320c
# Nov-21-2020 06:07:29 PM +UTC
CMD python -m poolmonitor.commands --end-height 11302991