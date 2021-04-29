ARG VERSION=xenial
FROM ubuntu:$VERSION
ARG VERSION

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

RUN apt-get update && \
    apt-get install -y software-properties-common apt-transport-https ca-certificates wget && \
    wget -O - https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB 2>/dev/null | apt-key add - && \
    add-apt-repository -y "deb https://apt.repos.intel.com/oneapi all main" && \
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null && \
    apt-add-repository "deb https://apt.kitware.com/ubuntu/ ${VERSION} main" && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        cmake \
        kmod \
        intel-oneapi-onevpl-devel-2021.2.2 \
        intel-oneapi-onevpl-devel \
        intel-basekit \
        intel-hpckit \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo ". /opt/intel/oneapi/setvars.sh" >> ~/.bashrc

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
