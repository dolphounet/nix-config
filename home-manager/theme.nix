{
  pkgs,
  config,
  ...
}: let
  nerdfonts = pkgs.nerdfonts.override {
    fonts = [
      "Ubuntu"
      "JetBrainsMono"
    ];
  };

  theme = {
    name = "Catppuccin-Mocha-Standard-Lavender-Dark";
    package = pkgs.catppuccin-gtk;
  };

  font = {
    name = "Ubuntu Nerd Font";
    package = nerdfonts;
    size = 14;
  };

  cursorTheme = {
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors;
    size = 32;
  };

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
      gnome.adwaita-icon-theme
      gtk-engine-murrine
      tokyonight-gtk-theme
      theme.package
      font.package
      cursorTheme.package
      iconTheme.package
    ];

    sessionVariables = {
      XCURSOR_THEME = cursorTheme.name;
      XCURSOR_SIZE = cursorTheme.size;
    };
  };
  
  dconf.enable = true;
  dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };

  gtk = {
    inherit font iconTheme;
    enable = true;
    catppuccin.enable = true;
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };
  
  catppuccin = {
    flavor = "mocha";
    accent = "blue";
    enable = true;
    pointerCursor = {
      enable = true;
      flavor = "mocha";
      accent = "blue";
    };
  };
}
