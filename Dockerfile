# This is a comment
FROM ubuntu:14.04
MAINTAINER Ethan Winograd <ethanwinograd@gmail.com>
RUN sudo apt-get update && apt-get install curl git default-jre default-jdk unzip --yes --force-yes
RUN useradd docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN mkdir -p /home/docker && chown -R docker:docker /home/docker
ADD sudoers.txt /etc/sudoers
RUN sudo chmod 440 /etc/sudoers
ENV HOME /home/docker
RUN cd /home/docker && yes|git clone https://github.com/ethanwinograd/scripts.git
RUN cd /home/docker && yes|git clone https://github.com/ethanwinograd/dotfiles.git
RUN sudo chmod 0777 /home/docker/dotfiles/install_dotfiles.sh;sudo chmod 0777 /home/docker/scripts/vim_setup.sh;sudo chmod 0777 /home/docker/scripts/ruby_setup.sh
WORKDIR /home/docker
USER docker
RUN sudo sh /home/docker/scripts/vim_setup.sh
RUN sh /home/docker/dotfiles/install_dotfiles.sh
RUN yes|curl -s get.gvmtool.net | bash
RUN bash -c "source ~/.gvm/bin/gvm-init.sh && gvm install springboot; exit 0"

EXPOSE 8080

RUN bash
