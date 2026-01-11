{ pkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/core.nix
      ../../modules/nvidia.nix
      ../../modules/gaming.nix
      ../../modules/desktop.nix
      ../../modules/virt.nix
    ];


  networking.hostName = "aya";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 8;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.11"; 
}
