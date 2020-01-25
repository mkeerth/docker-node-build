FROM node:12.14

# Base tools
RUN apt-get update \
    && apt-get -y install less man ssh python python-pip libpython-dev python-dev jq apt-transport-https curl apt-transport-https \
                       ca-certificates mysql-client libxml2-utils httpie unzip openssh-client rsync pwgen gridsite-clients gnupg2 \
                       software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# MkDocs tools
ENV PYTHONIOENCODING=UTF-8
RUN pip install mkdocs mkdocs-material pymdown-extensions pygments \
    && pip install --upgrade Pygments \
    && npm install -g jsdoc-to-markdown swagger-markdown --ignore-scripts \
    && npm cache clean --force

WORKDIR /opt/app-build
