# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.187.0/containers/cpp/.devcontainer/base.Dockerfile

FROM mcr.microsoft.com/devcontainers/base:1-jammy

ENV GCC_VERSION=10 \
    CLANG_VERSION=11 \
    CONAN_VERSION="1.62.0" \
    CONAN_PKG_VERSION="0.39.1" \
    CMAKE_VERSION_FULL="3.28.1" \
    CC=/usr/bin/gcc \
    CXX=/usr/bin/g++ \
    DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends --no-install-suggests \
    sudo \
    binutils \
    wget \
    git \
    libc6-dev \
    g++-${GCC_VERSION} \
    clang-${CLANG_VERSION} \
    clang-tidy \
    cppcheck \
    valgrind \
    gdb \
    libgmp-dev \
    libmpfr-dev \
    libmpc-dev \
    nasm \
    dh-autoreconf \
    ninja-build \
    libffi-dev \
    libssl-dev \
    pkg-config \
    subversion \
    zlib1g-dev \
    libbz2-dev \
    libsqlite3-dev \
    libreadline-dev \
    xz-utils \
    curl \
    libncurses5-dev \
    libncursesw5-dev \
    liblzma-dev \
    ca-certificates \
    autoconf-archive \
    python3 \
    python3-pip \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-${GCC_VERSION} 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-${GCC_VERSION} 100 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${GCC_VERSION} 100 \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-${GCC_VERSION} 100 \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${CLANG_VERSION} 100 \
    && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${CLANG_VERSION} 100 \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fL https://getcli.jfrog.io | sh \
    && mv jfrog /usr/local/bin/jfrog \
    && chmod +x /usr/local/bin/jfrog \
    && pip install -q --upgrade --no-cache-dir pip==21.2.1 \
    && pip install -q --no-cache-dir conan==${CONAN_VERSION} conan-package-tools==${CONAN_PKG_VERSION} cmake==${CMAKE_VERSION_FULL}


COPY default-profile /home/vscode/.conan/profiles/default