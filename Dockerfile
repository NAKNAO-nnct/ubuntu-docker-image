FROM ubuntu:24.04

COPY --from=myoung34/github-runner-base:latest /tmp/build/ /tmp/build/

RUN /tmp/build/install_base.sh

CMD ["/bin/bash"]
