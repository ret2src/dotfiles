#!/usr/bin/env bash

if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$NAME" =~ "Kali" ]]; then
        echo "[*] Detected distribution: Kali Linux"
        sudo apt update
        sudo apt install -y wget \
                            curl \
                            xclip \
                            xsel \
                            zsh \
                            neovim \
                            tmux
        echo "[*] Installation of dependencies finished. You can now link the dotfiles using the 'stow.sh' script."
    elif [[ "$NAME" =~ "Arch" ]]; then
        echo "[*] Detected distribution: Arch Linux"
        #TODO: Add packages to install...
    fi

else
    echo "[-] Sorry, could not determine distribution. Aborting."
    exit 0
fi
