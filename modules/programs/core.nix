{ pkgs, inputs, ... }:
{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
  	bitwarden-desktop	
  ];
}
