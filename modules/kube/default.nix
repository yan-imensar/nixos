{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
  	kubectl
	  kubernetes-helm
  ];
}
