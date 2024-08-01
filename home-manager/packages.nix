{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    bat
    cava
    hyprpaper
    libreoffice-fresh
    hyprcursor
    chezmoi
    gnome.gnome-themes-extra
    gnome.gnome-calendar
    nwg-look
    vlc
  ];
}
