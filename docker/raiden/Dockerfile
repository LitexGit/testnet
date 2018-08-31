FROM python:3.6

# install dependencies
RUN apt-get update
RUN apt-get install -y git-core wget xz-utils

# use --build-arg RAIDENVERSION=v0.0.3 to build a specific (tagged) version
#ARG REPO=raiden-network/raiden
#ARG RAIDENVERSION=master

# This is a "hack" to automatically invalidate the cache in case there are new commits
#ADD https://api.github.com/repos/${REPO}/commits/${RAIDENVERSION} /dev/null

# clone raiden repo + install dependencies
#RUN git clone -b dev git@gitlab.milewan.com:litex/raiden-litex.git
#WORKDIR /raiden-litex
#RUN git tag -d litex0.1

ADD ./raiden /raiden
RUN rm /raiden/.git
ADD .git/modules/raiden /raiden/.git
WORKDIR /raiden


RUN pip install -r requirements.txt

# build contracts and web_ui
RUN python setup.py develop

# install raiden and pyinstaller
#RUN pip install .
#RUN pip install pyinstaller

# build pyinstaller package
#RUN pyinstaller --noconfirm --clean raiden.spec

# pack result to have a unique name to get it out of the container later
#RUN cd dist && \
#    tar -cvzf raiden-${RAIDENVERSION}-linux.tar.gz raiden* && \
#    mv raiden-${RAIDENVERSION}-linux.tar.gz ..

EXPOSE 5001

CMD raiden --keystore-path /keystore --eth-rpc-endpoint 13.113.210.237:8545 --api-address 0.0.0.0:5001
