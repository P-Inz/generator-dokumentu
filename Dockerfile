FROM ubuntu:22.04

RUN mkdir -p /usr/src/scripts
RUN mkdir -p /usr/src/output
RUN mkdir -p /usr/src/data

RUN apt-get update
RUN apt-get install texlive-full -y

RUN apt-get install texlive-math-extra -y
RUN apt-get install texlive-science -y
RUN apt-get install texlive-latex-extra-doc -y
RUN apt-get install texlive-latex-extra -y
RUN apt-get install texlive-lang-polish -y
RUN apt-get install texlive-fonts-recommended -y
RUN apt-get install xzdec -y






#RUN cd ~; \
#	mkdir ~/texmf; \
#	tlmgr init-usertree; \
#	tlmgr option repository ftp://tug.org/historic/systems/texlive/2015/tlnet-final \
#	tlmgr update;
#
#RUN tlmgr install listings
#
#COPY ./scripts/ /usr/src/scripts
#
#RUN chmod +x /usr/src/scripts/entrypoint.sh
#RUN chmod +x /usr/src/scripts/run.sh
#
#EXPOSE 1433
#
#CMD /bin/bash /usr/src/scripts/entrypoint.sh