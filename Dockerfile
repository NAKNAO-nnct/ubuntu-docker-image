FROM ubuntu:24.04

RUN git clone --depth 1 https://github.com/myoung34/docker-github-actions-runner.git

RUN docker-github-actions-runner/build/install_base.sh

CMD ["/bin/bash"]
