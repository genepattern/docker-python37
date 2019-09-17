# copyright 2017-2018 Regents of the University of California and the Broad Institute. All rights reserved.
FROM python:3.7

MAINTAINER Thorin Tabor <tmtabor@cloud.ucsd.edu>

ENV LANG=C LC_ALL=C

RUN apt-get update && apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 \
    libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 \
    libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 \
    ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

COPY common/container_scripts/runS3OnBatch.sh common/container_scripts/runLocal.sh /usr/local/bin/

RUN mkdir /build && \
    mkdir /conda && \
    cd /conda && \
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda
    
ENV PATH="/opt/conda/bin:${PATH}"

ADD requirements.txt build.py /build/
RUN pip install -r /build/requirements.txt
RUN pip install sklearn && \
    pip install awscli && \
    pip install cuzcatlan ccal && \
    python /build/build.py && \
  	chmod ugo+x /usr/local/bin/runS3OnBatch.sh && \
    chmod ugo+x /usr/local/bin/runLocal.sh

CMD [ "/usr/local/bin/runS3OnBatch.sh"]
