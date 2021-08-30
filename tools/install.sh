#! /bin/bash

set -e

# Default settings
NIXCONFIG=${NIXCONFIG:-"$HOME/.nixconfig"}

# Install nix (Single User Installation)
# https://nixos.org/manual/nix/stable/#chap-installation
# curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --no-daemon

# curl -L https://nixos.org/nix/install | sh -s -- --daemon

. $HOME/.nix-profile/etc/profile.d/nix.sh

# Install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

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
