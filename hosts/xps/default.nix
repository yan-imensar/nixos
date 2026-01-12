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


  networking.hostName = "xps";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 8;
  boot.loader.efi.canTouchEfiVariables = true;

  services.thermald.enable = true;
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;

  boot.extraModprobeConfig = ''
    blacklist nouveau
    options nouveau modeset=0
  '';
  
	services.udev.extraRules = ''
	  # Remove NVIDIA USB xHCI Host Controller devices, if present
	  ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
	  # Remove NVIDIA USB Type-C UCSI devices, if present
	  ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
	  # Remove NVIDIA Audio devices, if present
	  ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
	  # Remove NVIDIA VGA/3D controller devices
	  ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
	'';
	boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];

  system.stateVersion = "25.11"; 
}
