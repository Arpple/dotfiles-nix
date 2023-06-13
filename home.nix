{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.username = "arpple";
  home.homeDirectory = "/home/arpple";
  home.stateVersion = "23.05";

  news.display = "silent";
  
  home.packages = with pkgs; [
    git
    fish
    alacritty
    starship
    emacs
    direnv 
    dmenu
    firefox
    
    ripgrep
    fd
  ];

  fonts.fontconfig.enable = true;
  
  programs.git = {
    enable = true;
    userEmail = "apple0239@gmail.com";
    userName = "arpple";
  };

  programs.fish = {
    enable = true;
    
    shellInit = ''
      set -xg PATH ~/.config/emacs/bin $PATH
    '';
  };

  programs.alacritty.enable = true;
  programs.starship.enable = true;

  home.file.".config/alacritty/alacritty.yml".source = ./alacritty.yml;
  home.file.".config/starship.toml".source = ./starship.toml;
  home.file.".config/i3/config".source = ./i3.config;
  home.file.".config/doom".source = ./doom;
}
