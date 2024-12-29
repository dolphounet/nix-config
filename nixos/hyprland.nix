{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  security = {
    pam.services.ags = {};
  };

  environment.systemPackages = with pkgs; [
    nautilus
    adwaita-icon-theme
    pavucontrol
    brightnessctl
    wl-clipboard
    hyprland-protocols
  ];

  services = {
    hypridle.enable = true;
  };
}
