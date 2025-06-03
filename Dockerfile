# FROM ubuntu:24.04

# RUN apt-get update && apt-get install -y git curl sudo

# RUN git clone --depth 1 https://github.com/myoung34/docker-github-actions-runner.git

# WORKDIR /docker-github-actions-runner

# RUN chmod +x build/*.sh && build/install_base.sh
FROM myoung34/github-runner-base:latest

CMD ["/bin/bash"]
