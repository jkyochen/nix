#! /bin/bash

set -e

# Default settings
NixConfig=${NixConfig:-~/.nixconfig}
REPO=${REPO:-lanlyhs/nix}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-main}

# Install nix (Single User Installation)
# https://nixos.org/manual/nix/stable/#chap-installation
curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
# curl -L https://nixos.org/nix/install | sh -s -- --daemon
soruce .bashrc

# Install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Clone config
nix-shell -p git
git clone -c core.eol=lf -c core.autocrlf=false \
  -c fsck.zeroPaddedFilemode=ignore \
  -c fetch.fsck.zeroPaddedFilemode=ignore \
  -c receive.fsck.zeroPaddedFilemode=ignore \
  --depth=1 --branch "$BRANCH" "$REMOTE" "$NixConfig" || {
  fmt_error "git clone of nix repo failed"
  exit 1
}
exit

# Reload
cp -rf $NixConfig/home-manager/ .config/nixpkgs/
home-manager switch
