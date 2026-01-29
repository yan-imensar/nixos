{ pkgs, ... }:
{
  # Gnome & Xserver
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.brightness-control-using-ddcutil
    gnomeExtensions.tiling-shell
    gnomeExtensions.tray-icons-reloaded
    gnome-tweaks
  ];

  # Clavier Colemak
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak";
  };
}
