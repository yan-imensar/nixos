{ pkgs, ... }:
{
  programs.thunderbird.enable = true;

  environment.systemPackages = with pkgs; [
    signal-desktop
    discord
  ];
}
