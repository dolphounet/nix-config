{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    bat
    libreoffice-still
    hyprcursor
    gnome-themes-extra
    microfetch
    vesktop
    qbittorrent
    floorp
    obsidian
    radeontop
    feh
    gimp
    blender
    zip
    unzip
    obs-studio
    kdePackages.kdenlive
    python311
    inputs.ghostty.packages."${pkgs.system}".default
  ];
}
