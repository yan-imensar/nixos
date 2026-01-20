{ pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/system/core.nix
      ../../modules/hardware/nvidia.nix
      ../../modules/hardware/bluetooth.nix
      ../../modules/desktop/gnome.nix
      ../../modules/desktop/audio.nix
      ../../modules/desktop/printing.nix
      ../../modules/programs/browsers.nix
      ../../modules/programs/communication.nix
      ../../modules/programs/gaming.nix
      ../../modules/programs/virtualization.nix
      ../../modules/services/flatpak.nix
    ];

  networking.hostName = "aya";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 8;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.11";
}
