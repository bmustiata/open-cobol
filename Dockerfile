FROM ubuntu:18.04 as build

RUN apt update -y
RUN apt install -y subversion
RUN svn checkout --trust-server-cert https://svn.code.sf.net/p/open-cobol/code/tags/gnucobol-2.2 open-cobol-2.2
RUN apt install -y build-essential
RUN apt install -y autotools-dev automake
RUN apt install -y autopoint libtool
RUN apt install -y libgmp3-dev
RUN apt install -y libdb-dev
RUN apt install -y autoconf m4
RUN apt install -y flex
RUN apt install -y bison
RUN apt install -y help2man
RUN apt install -y texinfo
RUN cd /open-cobol-2.2 && ./build_aux/bootstrap && ./configure && make && make install
RUN ldconfig
