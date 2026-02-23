{ pkgs, pkgs-stable, ... }:
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
    aerospace
    vscode
    claude-code
    google-chrome
  ];

  homebrew = {
    enable = true;
    brews = [
      "mas"
    ];
    casks = [
      "netbirdio/tap/netbird-ui"
    ];
    onActivation.cleanup = "zap";
  };

  system.primaryUser = "yan";
  system.defaults = {
    dock.autohide = true;
    dock.autohide-delay = 0.0;
    dock.autohide-time-modifier = 0.2;
    dock.expose-animation-duration = 0.2;
    dock.showhidden = true;
    dock.show-recents = false;
    dock.show-process-indicators = true;
    finder.FXPreferredViewStyle = "clmv";
    loginwindow.GuestEnabled = false;
    NSGlobalDomain.KeyRepeat = 2;
  };
  
  programs.direnv.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = 6;

}
