# This is a comment
FROM ubuntu:14.04
MAINTAINER Ethan Winograd <ethanwinograd@gmail.com>
RUN sudo apt-get update && apt-get install curl git default-jre default-jdk unzip --yes --force-yes
RUN yes|curl -s get.gvmtool.net | bash
RUN yes|sudo git clone https://github.com/ethanwinograd/scripts.git
RUN yes|sudo git clone https://github.com/ethanwinograd/dotfiles.git
RUN sudo chmod 0777 ./dotfiles/install_dotfiles.sh
RUN sudo chmod 0777 ./scripts/vim_setup.sh
RUN sudo chmod 0777 ./scripts/ruby_setup.sh 

RUN bash -c "source ~/.gvm/bin/gvm-init.sh && gvm install springboot; exit 0"

EXPOSE 8080

RUN bash
