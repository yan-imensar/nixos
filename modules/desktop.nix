{ pkgs, ... }:
{
  # Gnome & Xserver
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Clavier Colemak
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak";
  };

  # Son (Pipewire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      experimental = true;
      Privacy = "device";
      JustWorksRepairing = "always";
      Class = "0x000100";
      FastConnectable = true;
    };
  };
  services.blueman.enable = true;

  # AppImage & Flatpak
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  
  # Impression
  services.printing.enable = true;
  
  # Navigateur
  programs.firefox.enable = true;
}
