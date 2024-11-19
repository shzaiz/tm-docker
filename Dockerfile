FROM debian:bookworm
#ubuntu:22.04
#MAINTAINER Massimiliano Gubinelli <m.gubinelli@gmail.com>

LABEL org.opencontainers.image.title="Debian Bookword + git + TeXmacs"
LABEL org.opencontainers.image.description="Debian image with git + TeXmacs pre-installed. Intended primarily for CD workflows."
#LABEL org.opencontainers.image.documentation="https://github.com/actions/checkout/tree/main/images/test-ubuntu-git.md"
LABEL org.opencontainers.image.licenses=MIT

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y build-essential wget git libfontconfig1 
#    && rm -rf /var/lib/apt/lists/*


RUN apt-get install -y --fix-missing \
    && apt-get install -f -y

# Install TeXmacs 2.1.4 from package
RUN wget http://www.texmacs.org/Download/ftp/tmftp/Linux/Debian_12/TeXmacs-2.1.4.amd64.deb -O /tmp/texmacs.deb \
    && DEBIAN_FRONTEND=noninteractive apt install -y /tmp/texmacs.deb \ 
    && rm -r /tmp/texmacs.deb 

WORKDIR /usr/local/app
RUN useradd app
USER app

