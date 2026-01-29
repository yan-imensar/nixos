{ pkgs, ... }:
{
  # Optimisation et GC
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.i2c.enable = true;

  environment.systemPackages = with pkgs; [
    lm_sensors
  ];

  programs.direnv.enable = true;

  # Locale & Time
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # User
  users.users.bomal = {
    isNormalUser = true;
    description = "Yan IMENSAR";
    extraGroups = [ "networkmanager" "wheel" "i2c"];
    packages = with pkgs; [
      neovim
      git
    ];

  };

  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
