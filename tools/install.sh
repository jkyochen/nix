#! /bin/bash

set -e

# Default settings
NIXCONFIG=${NIXCONFIG:-"$HOME/.nixconfig"}

# Clone config
nix-shell -p git --run "git clone -c core.eol=lf -c core.autocrlf=false -c fsck.zeroPaddedFilemode=ignore -c fetch.fsck.zeroPaddedFilemode=ignore -c receive.fsck.zeroPaddedFilemode=ignore --depth=1 https://github.com/lanlyhs/nix.git $NIXCONFIG"

# Reload
cp -rf $NIXCONFIG/home-manager/* $HOME/.config/nixpkgs/
home-manager switch

# Set Default Shell Zsh
if ! grep -Fxq "$(which zsh)" /etc/shells; then
    command -v zsh | sudo tee -a /etc/shells
fi

sudo chsh -s "$(command -v zsh)" "${USER}"

zsh
