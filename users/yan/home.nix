{ config, pkgs, ... }:

{
  home.username = "yan";
  home.homeDirectory = "/home/yan";

  programs.git = {
    enable = true;
    userName = "Yan IMENSAR";
    userEmail = "yimensar@guimini.com";
  };

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}

