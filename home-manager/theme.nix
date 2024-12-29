{
  pkgs,
  config,
  outputs,
  ...
}: let
  epson-font = pkgs.callPackage ../pkgs/epson.nix {inherit pkgs;};
  iosevka-custom = pkgs.callPackage ../pkgs/iosevka-custom.nix {inherit pkgs;};

  theme = {
    name = "Tokyonight-Dark";
    package = pkgs.tokyonight-gtk-theme;
  };

  font = {
    name = "Ubuntu Nerd Font";
    size = 14;
  };

  iconTheme = {
    name = "MoreWaita";
    package = pkgs.morewaita-icon-theme;
  };
in {
  home = {
    packages = with pkgs; [
      epson-font
      iosevka-custom
      gtk3
      cantarell-fonts
      font-awesome
      jetbrains-mono
      adwaita-icon-theme
      gtk-engine-murrine
      theme.package
      iconTheme.package
      nerd-fonts.ubuntu
      nerd-fonts.jetbrains-mono
    ];

    #sessionVariables = {
    #  XCURSOR_THEME = cursorTheme.name;
    #  XCURSOR_SIZE = cursorTheme.size;
    #};
  };

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    inherit font iconTheme theme;
    enable = true;
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    package = outputs.packages."x86_64-linux".banana-cursor-dreams;
    size = 48;
    name = "Banana-Tokyo-Night-Storm"; # Change to whatever theme you like
  };
}
