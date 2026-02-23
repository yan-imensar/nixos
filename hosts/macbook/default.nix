{ pkgs, ... }:
{
  imports =
    [
    ];

  networking.hostName = "macbook-yan";
  networking.computerName = "MacBook Yan";

  environment.systemPackages = with pkgs; [
    neovim
    kitty
    bitwarden-desktop
    _1password-gui
  ];

  homebrew = {
    enable = true;
    brews = [
      "mas"
    ];
    casks = [
    ];
    onActivation.cleanup = "zap";
  };

  system.primaryUser = "yan";
  system.defaults = {
    dock.autohide = true;
    finder.FXPreferredViewStyle = "clmv";
    loginwindow.GuestEnabled = false;
    NSGlobalDomain.KeyRepeat = 2;
  };
  

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = 6;

}
