FROM resin/rpi-raspbian
RUN apt-get update && apt-get install -y \
        curl \
        iproute2 \
        wget \
        vim
WORKDIR /opt/packetbeat
# Downloading from Google storage is a little tricky as the URLs need to be doctored.
# Original URL : https://beats-ci.elastic.co/job/elastic+beats+master+multijob-package-linux/gcsObjects/
RUN wget https://storage.googleapis.com/beats-ci-artifacts/snapshots/packetbeat/packetbeat-6.7.0-SNAPSHOT-armhf.deb
RUN dpkg -i packetbeat-6.7.0-SNAPSHOT-armhf.deb 
COPY *.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
