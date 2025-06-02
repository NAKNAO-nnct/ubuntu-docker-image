FROM ubuntu:24.04

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

CMD ["/bin/bash"]
