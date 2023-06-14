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
    direnv 
    dmenu
    polybar
    firefox
    asdf-vm
    any-nix-shell
    killall
    bspwm

    ripgrep
    fd

    awscli2
    yarn
    google-chrome
    slack
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
      any-nix-shell fish --info-right | source
    '';
  };

  programs.alacritty.enable = true;
  programs.starship.enable = true;

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
