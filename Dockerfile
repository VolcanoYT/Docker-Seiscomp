FROM repo.volcanoyt.com/base:novnc-ubuntu

# Copy binary file (make sure you sync.sh first time)
COPY binary ${WORK}

# Config Seiscomp
ENV SEISCOMP_ROOT=/home/${USER}/seiscomp
ENV PATH=/home/${USER}/seiscomp/bin:$PATH
ENV LD_LIBRARY_PATH=/home/${USER}/seiscomp/lib:$LD_LIBRARY_PATH
ENV PYTHONPATH=/home/${USER}/seiscomp/lib/python:$PYTHONPATH
ENV MANPATH=/home/${USER}/seiscomp/share/man:$MANPATH

RUN apt-get update && apt-get install -y \
    # base | libpython3-dev for install-deps
    libxml2 libboost-filesystem1.71.0 libboost-iostreams1.71.0 libboost-thread1.71.0 libboost-program-options1.71.0 libboost-regex1.71.0 libboost-system1.71.0 libssl1.1 libncurses5 libmysqlclient21 libpq5 libpython3.8 python3-numpy \
    # fdsnw
    python3-twisted python3-dateutil \
    # gui | printsupport5 miss by scheli
    libqt5gui5 libqt5xml5 libqt5opengl5 libqt5sql5-sqlite libqt5printsupport5 \
    # mariadb
    mariadb-client \
    # Misc | gosu for one run and feh for wallpaper | gedit for notepad | florence for virtual keyboard
    gosu feh gedit florence

# Change this if you want to use it on public internet
# ENV PASS_SQL=demo
# We recommend using a separate database server so that when your container is shot down or has problems, the data will still be saved
# RUN apt-get install -y mariadb-server \
#    && service mysql start \
#    && mysqladmin -u root password ${PASS_SQL}

# Time to clean up
RUN apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# We install and copy on user 'sistem'
USER ${USER}

# Install seiscomp
RUN cd ${WORK} && for f in *.tar.gz; do tar -xzf "$f"; done && rm *.tar.gz

# seiscomp: Copy base menu gui
COPY config_base ${WORK}/.config/
# seiscomp: Copy base startup & station
COPY config_seiscomp ${WORK}/
# Copy misc data
COPY data ${WORK}/

# back to root and run it
USER root

# Copy etc config
COPY config_etc /etc/

# ~ The port you might need to know ~
# 3306 - opening raw database to public is quite dangerous, so if it's finished please delete it again 
# 5901 - vnc It might not be needed because you can access it through a browser via novnc (6080)
# 8080 or 80 - is a common port for fdsn server (public and private)
# 18000 - is a common port for seedlink & (slarchive for archiving stream) server (public)
# 16022 - is a common port for winston or earthworm server (public)
# 18002 or 8001 or 18001? - is a common port for server arclink (this requires email (identifiers) for data access)
EXPOSE 6080 8080 18000 16022