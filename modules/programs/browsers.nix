{ pkgs, inputs, ... }:
{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
  ];
}
