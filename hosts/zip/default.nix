{ pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/system/core.nix
      ../../modules/hardware/amd.nix
      ../../modules/hardware/bluetooth.nix
      ../../modules/desktop/gnome.nix
      ../../modules/desktop/audio.nix
      ../../modules/desktop/printing.nix
      ../../modules/desktop/hyprland.nix
      ../../modules/programs/core.nix
      ../../modules/programs/media.nix
      ../../modules/programs/vpn.nix
      ../../modules/programs/browsers.nix
      ../../modules/programs/communication.nix
      ../../modules/programs/development.nix
      ../../modules/programs/gaming.nix
      ../../modules/programs/virtualization.nix
      ../../modules/services/flatpak.nix
      ../../modules/work/core.nix
    ];

  networking.hostName = "zip";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 8;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.11";
}
