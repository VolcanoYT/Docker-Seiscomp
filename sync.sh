#!/bin/bash
# https://www.seiscomp.de/downloader/
# http://eida.gfz-potsdam.de/webdc3/
# wget "http://geofon.gfz-potsdam.de/fdsnws/station/1/query?net=GE&level=response" -O ge.xml
seiscomp_ver=4.0.2 
base_os=ubuntu20.04-x86_64

mkdir binary && cd binary || exit
wget -c https://www.seiscomp.de/downloader/seiscomp-${seiscomp_ver}-${base_os}.tar.gz -O - | tar -xz
wget -c https://www.seiscomp.de/downloader/seiscomp-${seiscomp_ver}-doc.tar.gz -O - | tar -xz
wget -c https://www.seiscomp.de/downloader/seiscomp-maps.tar.gz -O - | tar -xz
cd ..