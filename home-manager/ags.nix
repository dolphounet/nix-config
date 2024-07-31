{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    gtk3
    brightnessctl
    wl-clipboard
    networkmanager
    pavucontrol
  ];

  programs.ags = {
    enable = true;
    configDir = ../ags;
  };
}
