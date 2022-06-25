# Nix Config

> Nix is for Un*x Package manager.

## Install

```sh
# 1. install nix
# https://nixos.org/download.html#nix-install-linux

# 2. install home-manager
# https://rycee.gitlab.io/home-manager/index.html#sec-install-standalone

# 3. download home-manager config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lanlyhs/nix/main/tools/install.sh)"
```

### After ugprade macOS, can't find nix.

https://github.com/NixOS/nix/issues/3616

```sh
# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix
```

## Update

```sh
update
OR
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lanlyhs/nix/main/tools/update.sh)"
```

## Uninstall

```sh
# 1. uninstall nix
# https://gist.github.com/expelledboy/c00aebb004b178cf78b2c9b344526ff6
# https://gist.github.com/chriselsner/3ebe962a4c4bd1f14d39897fc5619732
# https://github.com/NixOS/nix/issues/1402

# 2. uninstall home-manager
home-manager uninstall
```

## Todo

- [ ] Support mulit env for some special tools.
- [ ] Migrate macOS Gui software from brew cask.
- [ ] Distinguish Linux and macOS special pkg like mas,m-cli.
