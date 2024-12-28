{
  pkgs,
  config,
  outputs,
  ...
}: let
  theme = {
    name = "Tokyonight-Dark";
    package = pkgs.tokyonight-gtk-theme;
  };

  font = {
    name = "Ubuntu Nerd Font";
    size = 14;
  };

  #cursorTheme = {
  #  name = "Catppuccin-Mocha-Dark-Cursors";
  #  package = pkgs.catppuccin-cursors;
  #  size = 32;
  #};

  iconTheme = {
    name = "MoreWaita";
    package = pkgs.morewaita-icon-theme;
  };
in {
  home = {
    packages = with pkgs; [
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
    #catppuccin.enable = false;
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  qt = {
    enable = true;
    #style.catppuccin.enable = false;
    #style.name = "gtk";
    platformTheme.name = "gtk";
  };

  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    package = outputs.packages."x86_64-linux".banana-cursor-dreams;
    size = 48;
    name = "Banana-Tokyo-Night-Storm"; # Change to whatever theme you like
  };
  #catppuccin = {
  #  flavor = "mocha";
  #  accent = "blue";
  #  enable = true;
  #  pointerCursor = {
  #    enable = true;
  #    flavor = "mocha";
  #    accent = "blue";
  #  };
  #};
}
