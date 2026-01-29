{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.lact.enable = true;
  programs.coolercontrol.enable = true;
  hardware.amdgpu.overdrive.enable = true;

  environment.systemPackages = with pkgs; [
    lm_sensors
    phoronix-test-suite
  ];


  hardware.amdgpu.opencl.enable = true;
}
