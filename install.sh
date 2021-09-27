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
                            stow \
                            zsh \
                            thefuck \
                            command-not-found \
                            tldr \
                            neovim \
                            tmux \
                            pipx

        # Backup already existing files and folders.
        mv ~/.oh-my-zsh ~/.oh-my-zsh.bak.d

        # Install oh-my-zsh.
        unset ZSH
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

        # Install powerlevel10k.
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

        # Install zsh-autosuggestions.
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

        # Install zsh-syntax-highlighting.
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

        # Backup zsh configuration.
        mv ~/.zshrc ~/.zshrc.bak

        # Backup bash configuration.
        mv ~/.bashrc ~/.bashrc.bak

        # Make zsh the default shell.
        chsh -s $(which zsh)
        sudo chsh -s $(which zsh)

        echo "[*] Installation of dependencies finished. You can now link the dotfiles using the 'stow.sh' script."
    elif [[ "$NAME" =~ "Arch" ]]; then
        echo "[*] Detected distribution: Arch Linux"
        #TODO: Add packages to install...
    fi

else
    echo "[-] Sorry, could not determine distribution. Aborting."
    exit 0
fi
