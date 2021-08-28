#! /bin/bash

set -e

nix-shell -p git --run "cd $HOME/.nixconfig; git pull --rebase --stat;"

cp -rf $HOME/.nixconfig/home-manager/ .config/nixpkgs/
home-manager switch
