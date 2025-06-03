FROM ubuntu:24.04

RUN apt-get update && apt-get install -y git curl sudo

RUN git clone --depth 1 https://github.com/myoung34/docker-github-actions-runner.git

WORKDIR /docker-github-actions-runner

RUN build/install_base.sh

CMD ["/bin/bash"]
