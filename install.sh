#! /bin/bash

set -e

# Install nix (Single User Installation)
# https://nixos.org/manual/nix/stable/#chap-installation
curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
# curl -L https://nixos.org/nix/install | sh -s -- --daemon

# Install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Clone config
nix-shell -p git --run "git clone -c core.eol=lf -c core.autocrlf=false -c fsck.zeroPaddedFilemode=ignore -c fetch.fsck.zeroPaddedFilemode=ignore -c receive.fsck.zeroPaddedFilemode=ignore --depth=1 https://github.com/lanlyhs/nix.git $HOME/.nixconfig"

# Reload
cp -rf $HOME/.nixconfig/home-manager/* .config/nixpkgs/
home-manager switch
