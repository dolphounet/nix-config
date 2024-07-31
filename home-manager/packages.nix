{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    librewolf
    bat
    cava
    hyprpaper
    libreoffice-fresh
    hyprcursor
    chezmoi
    wofi
    gnome.gnome-themes-extra
    gnome.gnome-calendar
    nwg-look
    vlc
  ];
}
