#!/bin/sh

rm -vf "$HOME/.local/bin/cobble"

if [ "$(id -u)" -eq 0 ]; then
    install -vm 755 ./cobble /usr/local/bin/cobble
elif echo "$PATH" | grep -q "$HOME/.local/bin"; then
    if ! rm -vf /usr/local/bin/cobble; then
        echo "Error: Could not remove preexisting installation at /usr/local/bin/cobble. Delete that file, or run this script with sudo"
        exit 1
    fi
    mkdir -p "$HOME/.local/bin"
    install -vm 755 ./cobble "$HOME/.local/bin/cobble"
else
    echo "Error: You don't have root privileges and $HOME/.local/bin is not in PATH"
    echo "Please add $HOME/.local/bin to your PATH, or run this script with sudo to install to /usr/local/bin/"
    exit 1
fi

echo "Installed successfully"
