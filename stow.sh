#!/usr/bin/env bash

cd ~/.config/dotfiles
stow -v -t ~ bash
stow -v -t ~ zsh
stow -v -t ~ tmux
stow -v -t ~ neovim
