{ config, pkgs, ... }:


{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.username = "arpple";
  home.homeDirectory = "/home/arpple";
  home.stateVersion = "23.05";

  news.display = "silent";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    git
    fish
    alacritty
    starship
    emacs
    neovim
    direnv 
    polybar
    firefox
    asdf-vm
    any-nix-shell
    killall
    bspwm
    chromium

    ripgrep
    fd
    gnumake
    unzip
    nodejs_20
    zig
    python3
    bash
    zip

    awscli2
    yarn
    google-chrome
    slack
    xorg.libXScrnSaver
    postman
    vscode
    ngrok
    aws-workspaces

    nodePackages.typescript-language-server
    lua-language-server
    ocaml
    opam
  ];

  fonts.fontconfig.enable = true;
  
  programs.git = {
    enable = true;
    userEmail = "apple0239@gmail.com";
    userName = "arpple";

    ignores = [
      ".arpple"
    ];
  };

  programs.fish = {
    enable = true;
    
    shellInit = ''
      set fish_greeting
      set -xg PATH ~/.config/emacs/bin $PATH
      set -xg PATH ~/.local/bin $PATH
      set -xg PATH ~/.npm-packages/bin $PATH
      set -xg NODE_PATH ~/.npm-packages/lib/node_modules
      set -xg NIXPKGS_ALLOW_INSECURE 1
      any-nix-shell fish --info-right | source
      alias chrome=google-chrome-stable

      # opam configuration
      source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
    '';
  };

  programs.alacritty.enable = true;
  programs.starship.enable = true;
  programs.chromium.enable = true;

  services.polybar = {
    enable = true;
    config = ./polybar/config.ini;
    script = "polybar bar &";
  };

  home.file.".config/alacritty/alacritty.yml".source = ./alacritty.yml;
  home.file.".config/starship.toml".source = ./starship.toml;
  home.file.".config/i3/config".source = ./i3.config;
  home.file.".config/doom".source = ./doom;
  home.file.".config/polybar/launch.sh".source = ./polybar/launch.sh;
}
