{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    bat
    cava
    hyprpaper
    libreoffice-fresh
    hyprcursor
    gnome-themes-extra
    vlc
    fastfetch
    vesktop
    qbittorrent
    qtrvsim
    floorp
    obsidian
    radeontop
    feh
  ];
}
