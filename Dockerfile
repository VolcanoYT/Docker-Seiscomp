FROM repo.volcanoyt.com/base:novnc-ubuntu

# Copy binary file (make sure you sync.sh first time)
COPY binary ${WORK}

RUN apt-get update && apt-get install -y \
    # base | libpython3-dev for install-deps
    libxml2 libboost-filesystem1.71.0 libboost-iostreams1.71.0 libboost-thread1.71.0 libboost-program-options1.71.0 libboost-regex1.71.0 libboost-system1.71.0 libssl1.1 libncurses5 libmysqlclient21 libpq5 libpython3.8 python3-numpy \
    # fdsnw
    python3-twisted python3-dateutil \
    # gui
    libqt5gui5 libqt5xml5 libqt5opengl5 libqt5sql5-sqlite \
    # mariadb server
    mariadb-server mariadb-client \
    # Misc | gosu for one run and feh for wallpaper
    gosu feh

# Settings MySQL | todo for better https://www.seiscomp.de/doc/base/tutorials/postinstall.html
RUN service mysql start\
    && mysqladmin -u root password demo \
    && apt-get autoremove && apt-get clean\
    && rm -rf /var/lib/apt/lists/*

# We install this on user 'sistem'
USER ${USER}

# for simpel cmd
ENV SEISCOMP_ROOT=/home/${USER}/seiscomp
ENV PATH=/home/${USER}/seiscomp/bin:$PATH
ENV LD_LIBRARY_PATH=/home/${USER}/seiscomp/lib:$LD_LIBRARY_PATH
ENV PYTHONPATH=/home/${USER}/seiscomp/lib/python:$PYTHONPATH
ENV MANPATH=/home/${USER}/seiscomp/share/man:$MANPATH

# Install seiscomp
RUN cd ${WORK} && for f in *.tar.gz; do tar -xzf "$f"; done && rm *.tar.gz

# Copy base menu gui seiscomp
COPY config_base ${WORK}/.config/
# Copy config data
COPY data ${WORK}/

# back to root and run it
USER root

# Copy etc config
COPY etc_base /etc/