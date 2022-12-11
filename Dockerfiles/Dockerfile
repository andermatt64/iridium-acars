FROM ubuntu:22.04

RUN apt update && \
  apt upgrade -y && \
  DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y gnuradio-dev gr-osmosdr cmake libsndfile1-dev git python3-crcmod supervisor

WORKDIR /root
RUN git clone https://github.com/muccc/iridium-toolkit.git && \
  git clone https://github.com/muccc/gr-iridium && \
  cd gr-iridium && \
  cmake -B build && \
  cmake --build build -j $(nproc) && \
  cmake --install build && \
  ldconfig

COPY ./Dockerfiles/iridium-parserd /usr/local/bin/iridium-parserd
COPY ./Dockerfiles/acars-extractor /usr/local/bin/acars-extractor
COPY ./Dockerfiles/airspy.conf /root/airspy.conf
COPY ./Dockerfiles/iridium.conf /etc/supervisor/conf.d/iridium.conf
COPY ./Dockerfiles/entrypoint.sh /

ENTRYPOINT [ "/entrypoints.sh" ]
