{
  inputs,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = true;
      preload = [
        "../wallpaper/wallpaper.jpg"
      ];
      wallpaper = [
        "eDP-1,../wallpaper/wallpaper.jpg"
      ];
    };
  };
}
