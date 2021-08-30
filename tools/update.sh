#! /bin/bash

set -e

nix-shell -p git --run "cd $HOME/.nixconfig; git pull --rebase --stat;"

rm -rf ${HOME}/.config/nixpkgs/
cp -rf $HOME/.nixconfig/home-manager/* $HOME/.config/nixpkgs/
home-manager switch
