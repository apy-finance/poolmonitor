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
# https://etherscan.io/tx/0x6f1bd88a392d209f34c72749a1692dfd9e001f38d36cc060ae3f6d8335905700
# Nov-21-2020 06:07:07 PM +UTC
CMD python -m poolmonitor.commands --end-height 11302989