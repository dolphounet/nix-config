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
        "/home/maxence/nix-config/wallpaper/wallpaper.jpg"
      ];
      wallpaper = [
        "eDP-1,/home/maxence/nix-config/wallpaper/wallpaper.jpg"
      ];
    };
  };
}
