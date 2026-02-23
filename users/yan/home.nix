{ config, pkgs, lib, ... }:

{
  home.username = "yan";
  home.homeDirectory = lib.mkForce "/Users/yan";

  programs.git = {
    enable = true;
    settings.user.name = "Yan IMENSAR";
    settings.user.email = "yimensar@guimini.com";
  };

  home.file.".config/kitty/kitty.conf".source = ./dotfiles/kitty.conf;
  home.file.".aerospace.toml".source = ./dotfiles/aerospace.toml;

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}

