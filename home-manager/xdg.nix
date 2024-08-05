{
  config,
  ...
}: {
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      pictures = "${config.home.homeDirectory}/Images";
      extraConfig = {
        XDG_3DMODELS_DIR = "${config.home.homeDirectory}/3DModels";
      };
    };
  };
}
