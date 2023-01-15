FROM ubuntu:22.04

RUN apt update && \
  apt upgrade -y && \
  DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y airspy libairspy-dev gnuradio-dev gr-osmosdr cmake libsndfile1-dev git python3-crcmod htop jq vim-nox

WORKDIR /root
RUN git clone https://github.com/muccc/iridium-toolkit.git && \
  git clone https://github.com/muccc/gr-iridium && \
  cd gr-iridium && \
  cmake -B build && \
  cmake --build build -j $(nproc) && \
  cmake --install build && \
  ldconfig

COPY ./Dockerfiles/airspy.conf /root/airspy.conf
COPY ./Dockerfiles/entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
