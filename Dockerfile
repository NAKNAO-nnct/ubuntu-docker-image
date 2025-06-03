FROM ubuntu:24.04

ENV DEBCONF_NOWARNINGS=yes

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    vim \
    unzip \
    tmux \
    git \
    ca-certificates \
    curl \
    wget \
    jq \
    yq \
    ssh \
    zip \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libreadline-dev \
    libffi-dev \
    libcurl4-openssl-dev \
    gnupg \
    tar \
    apt-transport-https \
    sudo \
    dirmngr \
    locales \
    gosu \
    gpg-agent \
    dumb-init \
    libc-bin

COPY ./scripts/* /tmp/scripts/
RUN chmod +x /tmp/scripts/*.sh

RUN /tmp/scripts/install_docker.sh

RUN /tmp/scripts/install_awscli.sh

# RUN echo '{"registry-mirrors":["https://mirror.gcr.io"]}' | sudo tee /etc/docker/daemon.json > /dev/null \
RUN (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
    && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y \
    && sudo ln -s /usr/bin/docker* /usr/local/bin/

RUN apt-get update && apt-get install -y --no-install-recommends docker-ce-cli

CMD ["/bin/bash"]
