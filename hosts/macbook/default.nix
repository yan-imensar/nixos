{ pkgs, ... }:
{

  networking.hostName = "macbook-yan";
  networking.computerName = "MacBook Yan";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    interval = { Weekday = 0; Hour = 0; Minute = 0; };
    options = "--delete-older-than 14d";
  };

  environment.systemPackages = with pkgs; [
    neovim
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 6;
}
