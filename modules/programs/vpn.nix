{ pkgs, inputs, ... }:
{

  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
  	netbird
  ];
}
