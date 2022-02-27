{ config, pkgs, ... }:

# machine
# ref https://github.com/douglasduteil/dotfiles/blob/master/nixpkgs/home.nix
# machine = import "${homeDir}/.config/nixpkgs/machine.nix";
# isMacOS = machine.operatingSystem == "Darwin";
# ref https://www.reddit.com/r/NixOS/comments/ae9q01/how_to_os_from_inside_a_nix_file/

let
  extraNodePackages = import ./node/default.nix { };

  advance-touch = pkgs.python39.pkgs.buildPythonPackage rec {
    pname = "advance-touch";
    version = "1.0.2";
    name = "${pname}-${version}";
    src = pkgs.python39.pkgs.fetchPypi {
      inherit pname version;
      sha256 = "1ib7hvabq9wf7b7l8zgdw18aqv1ifc912vl9xp64j3d1zgh0b313";
    };
    doCheck = false;
    propagatedBuildInputs = [
      pkgs.python39.pkgs.click
    ];
  };

in
{

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "$USER";
  # can't set $HOME, $HOME is /home/vagrant/.config/nixpkgs/home.nix
  home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      s = "subl .";
      # update = "sudo nixos-rebuild switch";
      switch = "home-manager switch";
      update = ".nixconfig/tools/update.sh";
      uninstall = ".nixconfig/tools/uninstall.sh";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    completionInit = "autoload -U compinit && compinit";
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "vagrant"
        # "tmux"
        # "tmuxinator"
      ];
      theme = "robbyrussell";
    };
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.4.0";
          sha256 = "037wz9fqmx0ngcwl9az55fgkipb745rymznxnssr3rx9irb6apzg";
        };
      }
      # {
      #   name = "enhancd";
      #   file = "init.sh";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "b4b4r07";
      #     repo = "enhancd";
      #     rev = "v2.2.4";
      #     sha256 = "1smskx9vkx78yhwspjq2c5r5swh9fc5xxa40ib4753f00wk4dwpp";
      #   };
      # }
    ];
    initExtra = ''
      if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
    '';
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    newSession = true;
    # tmuxinator = {
    #   enable = true;
    # };
  };

  programs.git = {
    enable = true;
    delta = {
      enable = true;
      options = {
        side-by-side = true;
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.vim = {
    enable = true;
  };
  programs.neovim = {
    enable = true;
  };
  programs.emacs = {
    enable = true;
  };

  programs.go = {
    enable = true;
    goPath = "go";
  };

  programs.command-not-found.enable = true;

  # https://github.com/ibraheemdev/modern-unix
  # https://github.com/alebcay/awesome-shell
  home.packages = with pkgs; [

    hello
    which
    man

    nix-index
    nixpkgs-fmt
    nix-info

    bash
    automake
    cmake

    gping
    htop
    glances

    curl
    wget

    httpie
    jq
    dogdns
    arp-scan
    httpstat
    mtr
    tcpdump
    wireshark-cli
    nmap
    netcat
    wrk
    junkie
    grpcurl
    mitmproxy
    speedtest-cli

    mkcert

    # Linux perf
    stress
    stress-ng
    fio

    docker
    docker-compose
    vagrant

    fd
    procs
    nnn

    less
    figlet
    lsof

    tree
    pstree
    jq

    ripgrep
    exa
    bat
    sl

    neofetch
    trash-cli
    peco

    # compiler
    gcc
    llvm

    # git
    git-repo-updater
    gh
    # git-ignore
    git-quick-stats
    git-extras

    # terminal
    asciinema

    tldr
    cheat

    # tools
    taskwarrior
    pbgopy
    translate-shell
    xsv

    # password
    pass
    bitwarden-cli

    openvpn

    # Programming Language
    nodejs
    # nodejs-16_x
    nodePackages.yarn
    # nodePackages.yo

    youtube-dl

    go

    # jdk
    jdk11

    ruby
    jekyll

    rustup

    # language package
    extraNodePackages.fanyi
    extraNodePackages.nrm
    (python39.withPackages (ps: with ps; [
      advance-touch
    ]))

    # software
    # vscode
    # electrum
    # qutebrowser

  ];

}
