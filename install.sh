#!/usr/bin/env bash

if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$NAME" =~ "Kali" ]]; then
        echo "[*] Detected distribution: Kali Linux"

        # Install tools and dependencies.
        sudo apt update
        sudo apt install -y git \
                            wget \
                            curl \
                            xclip \
                            xsel \
                            zsh \
                            neovim \
                            tmux
        # Install oh-my-zsh.
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

        # Install powerlevel10k.
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

        echo "[*] Installation of dependencies finished. You can now link the dotfiles using the 'stow.sh' script."
    elif [[ "$NAME" =~ "Arch" ]]; then
        echo "[*] Detected distribution: Arch Linux"
        #TODO: Add packages to install...
    fi

else
    echo "[-] Sorry, could not determine distribution. Aborting."
    exit 0
fi
