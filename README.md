# Nix Config

> Nix is for Un*x Package manager.

> Test in ArchLinux / Ubuntu / macOS Big Sur.

## Before

1. Need proxy in China， because of `https://cache.nixos.org/` is so slow. May be can try [tuna mirrors](https://mirrors.tuna.tsinghua.edu.cn/help/nix/).
2. Run in non-root user.

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

- [ ] Test in windows WSL2.
- [ ] Support mulit env for some special tools.
- [ ] Migrate pkg.md package.
- [ ] Migrate macOS Gui software from brew cask.
- [ ] Distinguish Linux and macOS special pkg like mas,m-cli.
