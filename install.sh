#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "Please pass the install mode as an argument."
    echo "Possible modes: --install,-i, --uninstall,-u"
    exit
fi

install() {
    path="/usr/local/bin"
    if [  "$1" = "--install" -o "$1" = "-i" ]; then
        echo "Installing fmc to $path."
        cp fmc $path

    elif [ "$1" = "--uninstall" -o "$1" = "-u" ]; then
        echo "Uninstalling fmc."
        rm $path/fmc
    fi
}

install $1
