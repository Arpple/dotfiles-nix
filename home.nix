{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.username = "arpple";
  home.homeDirectory = "/home/arpple";
  home.stateVersion = "21.11";

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
    xmobar
    trayer
    awscli2

    firefox

    (ripgrep.override { withPCRE2 = true; })
    fd
    imagemagick
    zstd
    editorconfig-core-c
    sqlite
    gcc
    unzip
    nixfmt
    xclip
    maim
    html-tidy
    shellcheck
    pandoc
    binutils
    gnumake

    unstable.nodejs
    nodePackages.javascript-typescript-langserver
    nodePackages.eslint

    php
    php74Packages.composer

    unstable.elixir
    unstable.elixir_ls

    elmPackages.elm
    elmPackages.elm-format
    elmPackages.elm-test

    clojure
    leiningen
    clj-kondo

    python3

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
      function ec
        emacsclient -c &
      end
    '';

    shellAliases = {
      psql-connect = "sudo -u postgres psql";
      e = "emacsclient -n";
    };
  };

  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  programs.alacritty.enable = true;
  programs.starship.enable = true;

  home.file.".xinitrc".source = ./xinitrc;
  home.file.".xmonad/xmobar.hs".source = ./xmobar.hs;
  home.file.".xmonad/xmonad.hs".source = ./xmonad.hs;
  home.file.".config/alacritty/alacritty.yml".source = ./alacritty.yml;
  home.file.".config/starship.toml".source = ./starship.toml;
  home.file.".doom.d".source = ./doom.d;
}
