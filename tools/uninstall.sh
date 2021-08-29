#! /bin/bash

set -e

yes | home-manager uninstall

rm -rf $HOME/{.nix-channels,.nix-defexpr,.nix-profile,.config/nixpkgs}
sudo rm -rf /nix

# For Multi-User install
# for i in $(seq 1 32); do sudo userdel -f nixbld$i; done
# sudo groupdel nixbld

# macOS
# for num in {1..32}; do sudo dscl . -delete /Users/nixbld$num; done
# sudo dscl . -delete /Groups/nixbld

# https://gist.github.com/expelledboy/c00aebb004b178cf78b2c9b344526ff6
# https://gist.github.com/chriselsner/3ebe962a4c4bd1f14d39897fc5619732
# https://github.com/NixOS/nix/issues/1402

rm -rf $HOME/.nixconfig/

sudo chsh -s "$(command -v bash)" "${USER}"
