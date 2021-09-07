{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.username = "arpple";
  home.homeDirectory = "/home/arpple";
  home.stateVersion = "21.05";

  news.display = "silent";

  home.packages = with pkgs; [
    git
    fish
    alacritty
    starship
    emacs
    direnv
    any-nix-shell
    dmenu
    firefox
    
    (ripgrep.override { withPCRE2 = true; })
    fd
    imagemagick
    zstd
    editorconfig-core-c
    sqlite

    nodejs
    nodePackages.javascript-typescript-langserver
    nodePackages.eslint
    php
    elixir
    elixir_ls
    elmPackages.elm
    clojure
    leiningen

    ghc
    haskell-language-server
    stack
  ];

  fonts.fontconfig.enable = true;

  programs.git = {
    userEmail = "apple0239@gmail.com";
    userName = "arpple";
  };

  programs.fish = {
    enable = true;

    loginShellInit = ''
      exec startx -- -keeptty
    '';

    shellInit = ''
      set -xg PATH ~/.emacs.d/bin $PATH
      any-nix-shell fish --info-right | source
    '';
  };

  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  programs.alacritty.enable = true;
  programs.starship.enable = true;

  home.file.".xinitrc".source = ./xinitrc;
  home.file.".xmonad/xmonad.hs".source = ./xmonad.hs;
  home.file.".config/alacritty/alacritty.yml".source = ./alacritty.yml;
  home.file.".config/starship.toml".source = ./starship.toml;
  home.file.".doom.d".source = ./doom.d;
}
