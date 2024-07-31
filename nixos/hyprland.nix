{pkgs, ...}:
{
  
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    
    programs.hyprlock.enable = true;
    services.hypridle.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };

    security = {
      polkit.enable = true;
      pam.services.ags = {};
    };

    environment.systemPackages = with pkgs; [
      pcmanfm
      hyprpaper
      adwaita-icon-theme
      pavucontrol
      brightnessctl
      wl-clipboard
      hyprland-protocols
      grim
      slurp
    ];

    services = {
      upower.enable = true;
    };
}
