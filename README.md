# Nix Config

> Nix is for Un*x Package manager.

> Test in ArchLinux / Ubuntu / macOS Big Sur.

## Before

1. Need proxy in China， because of `https://cache.nixos.org/` is so slow. May be can try [tuna mirrors](https://mirrors.tuna.tsinghua.edu.cn/help/nix/).

## Install

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lanlyhs/nix/main/tools/install.sh)"
```

### Verify

```sh
➜  ~ hello
Hello, world!
```

## Updating

```sh
update
OR
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lanlyhs/nix/main/tools/update.sh)"
```

## Uninstalling

```sh
uninstall
OR
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lanlyhs/nix/main/tools/uninstall.sh)"
```

## Todo

1. Test in windows WSL2.
2. Support mulit env for some special tools.
3. Migrate pkg.md package.
4. Migrate macOS Gui software from brew cask.
5. Distinguish Linux and macOS special pkg like mas,m-cli.
