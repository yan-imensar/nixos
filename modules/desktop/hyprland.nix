{ pkgs, ... }:
{

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  services.displayManager.gdm.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "colemak";
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
  security.pam.services.login.enableGnomeKeyring = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

  environment.systemPackages = with pkgs; [
    hyprlock
    hypridle
    hyprpaper
    hyprsunset
    hyprpicker
    hyprpolkitagent
    hyprlauncher
    kitty
    wofi
    mako   
    grim
    slurp
    wl-clipboard
    waybar
    nnn
  ];

}
