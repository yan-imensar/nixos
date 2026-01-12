{ pkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/core.nix
      ../../modules/gaming.nix
      ../../modules/desktop.nix
      ../../modules/virt.nix
    ];


  networking.hostName = "zip";
  networking.networkmanager.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.amdgpu.opencl.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 8;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.11"; 
}
