#! /bin/bash

set -e

NixConfig=${NixConfig:-~/.nixconfig}
BRANCH=${BRANCH:-main}

nix-shell -p git
git pull --rebase --stat origin "$BRANCH"
exit

cp -rf $NixConfig/home-manager/ .config/nixpkgs/
home-manager switch
