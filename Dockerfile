FROM ubuntu:22.04

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update \
    && apt install -y  \
        software-properties-common \
        gnupg \
        percol \
        git \
        make \
        curl \
        apt-transport-https \
        ca-certificates

# add ansible repo & install ansible
RUN add-apt-repository --yes --update ppa:ansible/ansible \
    && apt install -y ansible

# add hashicorp repo & install terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN add-apt-repository --yes --update "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    && apt install -y terraform

# install kubectl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update \
    && apt-get install -y kubectl
