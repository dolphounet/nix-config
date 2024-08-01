{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    bat
    cava
    hyprpaper
    libreoffice-fresh
    hyprcursor
    gnome.gnome-themes-extra
    vlc
    fastfetch
  ];
}
