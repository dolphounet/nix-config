{
  boot.kernelParams = [
    "amd_pstate=guided"
  ];
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
  };
}
