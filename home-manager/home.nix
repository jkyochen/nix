{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "$USER";
  # no set $HOME, $HOME is /home/vagrant/.config/nixpkgs/home.nix
  home.homeDirectory = "/home/$USER";

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
      # update = "sudo nixos-rebuild switch";
      switch = "home-manager switch";
      update = ".nixconfig/tools/update.sh";
      uninstall = ".nixconfig/tools/uninstall.sh";
    };
    sessionVariables = {
     EDITOR = "vim";
    };
    enableAutosuggestions =  true;
    enableCompletion =  true;
    enableSyntaxHighlighting =  true;
    autocd = true;
    completionInit =  "autoload -U compinit && compinit";
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
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
  };

  home.packages = [
    pkgs.hello
    pkgs.which
    pkgs.git
    pkgs.htop
    pkgs.git
    pkgs.vim
    pkgs.curl
    pkgs.wget
    pkgs.direnv
    pkgs.httpie
    pkgs.jq
    pkgs.less
    pkgs.figlet
    pkgs.lsof
    pkgs.tree
    pkgs.pstree
    pkgs.jq
    # pkgs.ctgas
    pkgs.ripgrep

    # Programming Language
    pkgs.nodejs
    pkgs.go
    pkgs.jdk
    pkgs.python39
    pkgs.ruby
  ];

  # zsh enableCompletion
  # environment.pathsToLink = [ "/share/zsh" ];

}
