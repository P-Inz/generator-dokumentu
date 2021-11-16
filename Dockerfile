FROM ubuntu:22.04

RUN apt-get update \
	&& DEBIAN_FRONTEND="noninteractive" apt-get install -y apt-utils \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update \
	&& echo 'tzdata tzdata/Areas select Europe' | debconf-set-selections \
	&& echo 'tzdata tzdata/Zones/Europe select Warsaw' | debconf-set-selections \
	&& DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update \
	&& DEBIAN_FRONTEND="noninteractive" apt-get install -y texlive \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update \
	&& DEBIAN_FRONTEND="noninteractive" apt-get install -y texlive-lang-polish \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update \
	&& DEBIAN_FRONTEND="noninteractive" apt-get install -y texlive-science \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# About 250 MB
#RUN apt-get update \
#	&& DEBIAN_FRONTEND="noninteractive" apt-get install -y texlive-latex-extra \
#	&& apt-get clean \
#	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# About 50 MB
#RUN apt-get update \
#	&& DEBIAN_FRONTEND="noninteractive" apt-get install -y texlive-publishers \
#	&& apt-get clean \
#	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update \
	&& DEBIAN_FRONTEND="noninteractive" apt-get install -y xzdec xz-utils \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Optional Big - about 2 GB
#RUN apt-get update \
#	&& apt-get install -y texlive-fonts-extra \
#	&& apt-get clean \
#	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd ~ \
	&& mkdir ~/texmf \
	&& tlmgr init-usertree \
	&& tlmgr option repository https://ftp.tu-chemnitz.de/pub/tug/historic/systems/texlive/2020/tlnet-final \
	&& tlmgr update --self
	
RUN tlmgr install listings
RUN tlmgr install tocbibind
RUN tlmgr install tabu
RUN tlmgr install varwidth
RUN tlmgr install pgf
RUN tlmgr install cleveref
RUN tlmgr install standalone
RUN tlmgr install currfile
RUN tlmgr install gincltex
RUN tlmgr install filemod
RUN tlmgr install todonotes
RUN tlmgr install svn-prov
RUN tlmgr install adjustbox
RUN tlmgr install collectbox
RUN tlmgr install csquotes
RUN tlmgr install newtx
RUN tlmgr install fontaxes
RUN tlmgr install xstring
RUN tlmgr install titlesec
RUN tlmgr install lipsum
RUN tlmgr install IEEEtran
	
	

#RUN mkdir -p /usr/src/scripts
#RUN mkdir -p /usr/src/output
#RUN mkdir -p /usr/src/data



#
#COPY ./scripts/ /usr/src/scripts
#
#RUN chmod +x /usr/src/scripts/entrypoint.sh
#RUN chmod +x /usr/src/scripts/run.sh
#
#EXPOSE 1433
#
#CMD /bin/bash /usr/src/scripts/entrypoint.sh
