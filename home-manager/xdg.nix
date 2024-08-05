{
  config,
  ...
}: {
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_3DMODELS_DIR = "${config.home.homeDirectory}/3DModels";
      };
    };
  };
}
