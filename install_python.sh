#!/usr/bin/env bash

set -e

# This is being run as root and so sudo is not needed

function download_cpython () {
    # 1: the version tag
    printf "\n### Downloading CPython source as Python-%s.tgz\n" "${1}"
    wget "https://www.python.org/ftp/python/${1}/Python-${1}.tgz" &> /dev/null
    tar -xvzf "Python-${1}.tgz" > /dev/null
    rm "Python-${1}.tgz"
}

function set_num_processors {
    # Set the number of processors used for build
    # to be 1 less than are available
    if [[ -f "$(command -v nproc)" ]]; then
        NPROC="$(nproc)"
    else
        NPROC="$(grep -c '^processor' /proc/cpuinfo)"
    fi
    echo "$((NPROC - 1))"
}

function build_cpython () {
    # 1: the prefix to be passed to configure
    #    c.f. https://docs.python.org/3/using/unix.html#python-related-paths-and-files
    # 2: the Python version being built

    # https://docs.python.org/3/using/unix.html#building-python
    # https://github.com/python/cpython/blob/3.10/README.rst
    # https://github.com/python/cpython/blob/3.9/README.rst
    # https://github.com/python/cpython/blob/3.8/README.rst
    # https://github.com/python/cpython/blob/3.7/README.rst
    # https://github.com/python/cpython/blob/3.6/README.rst
    printf "\n### ./configure --help\n"
    ./configure --help
    printf "\n### ./configure\n"
    if [[ "${2}" > "3.7.0"  ]]; then
        # --with-threads is removed in Python 3.7 (threading already on)
        ./configure --prefix="${1}" \
            --exec_prefix="${1}" \
            --with-ensurepip \
            --enable-optimizations \
            --with-lto \
            --enable-loadable-sqlite-extensions \
            --enable-ipv6
    else
        ./configure --prefix="${1}" \
            --exec_prefix="${1}" \
            --with-ensurepip \
            --enable-optimizations \
            --with-lto \
            --enable-loadable-sqlite-extensions \
            --enable-ipv6 \
            --with-threads
    fi
    printf "\n### make -j%s\n" "${NPROC}"
    make -j"${NPROC}"
    printf "\n### make -j%s test\n" "${NPROC}"
    make -j"${NPROC}" test
    printf "\n### make install\n"
    make install
}

function update_pip {
    # Update pip, setuptools, and wheel
    if [[ "$(id -u)" -eq 0 ]]; then
        # If root
        printf "\n### python3 -m pip --no-cache-dir install --upgrade pip setuptools wheel\n"
        python3 -m pip --no-cache-dir install --upgrade pip setuptools wheel
    else
        printf "\n### python3 -m pip --no-cache-dir install --user --upgrade pip setuptools wheel\n"
        python3 -m pip --no-cache-dir install --user --upgrade pip setuptools wheel
    fi
}

function symlink_python_to_python3 {
    local python_version
    python_version="$(python3 --version)"
    local which_python
    which_python="$(command -v python3)"
    local which_pip
    which_pip="$(command -v pip3)"

    # symlink python to python3
    printf "\n### ln --symbolic --force %s %s\n" "${which_python}" "/usr/bin/python"
    ln --symbolic --force "${which_python}" "/usr/bin/python"

    # symlink pip to pip3 if no pip exists or it is a different version than pip3
    if [[ -n "$(command -v pip)" ]]; then
        if [[ "$(pip --version)" = "$(pip3 --version)" ]]; then
            return 0
        fi
    fi
    printf "\n### ln --symbolic --force %s %s\n" "${which_pip}" "/usr/bin/pip"
    ln --symbolic --force "${which_pip}" "/usr/bin/pip"
    return 0
}

function main() {
    # 1: python version
    # 2: number of processors for make
    if [[ $# -lt 1 ]]; then
        printf "At least one argument required.  Got %s\n" "$#"
        return 1
    fi

    PYTHON_VERSION=$1
    NPROC=${2:-$(set_num_processors)}

    cd /root
    download_cpython "${PYTHON_VERSION}"
    cd "Python-${PYTHON_VERSION}"
    build_cpython /usr "${PYTHON_VERSION}"
    update_pip
    symlink_python_to_python3
}

main "$@" || exit 1