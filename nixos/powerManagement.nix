{
  boot.kernelParams = [
    "amd_pstate=guided"
  ];
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "ondemand";
  };
  services.upower.enable = true;
}
