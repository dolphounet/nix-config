{
  inputs,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      {
        ipc = "off";
        splash = true;
        preload = [
          "/home/maxence/nix-config/wallpaper/wallpaper.jpg"
        ];
        wallpaper = [
          "/home/maxence/nix-config/wallpaper/wallpaper.jpg"
        ];
      };
    };
  };
}
