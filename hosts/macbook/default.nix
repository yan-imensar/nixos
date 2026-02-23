{ pkgs, ... }:
{

  networking.hostName = "macbook-yan";
  networking.computerName = "MacBook Yan";

  environment.systemPackages = with pkgs; [
    neovim
    sl
    git
    firefox
  ];

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
