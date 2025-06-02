FROM ubuntu:24.04

RUN apt-get update && apt-get upgrade -y && apk-get install -y curl zip tmux git

CMD ["/bin/bash"]
