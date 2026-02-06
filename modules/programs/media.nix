{ pkgs, inputs, ... }:
{

  environment.systemPackages = with pkgs; [
  	spotify
  ];
	services.syncthing = {
	  enable = true;
	  openDefaultPorts = true; # Open ports in the firewall for Syncthing. (NOTE: this will not open syncthing gui port)
	};
}
