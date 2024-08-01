{
  inputs,
  pkgs,
  ...
}: {
  services.hypridle = {
    enable = true;
    settings = {
      listener = [
      {
      timeout = 300;
      on-timeout = "hyprlock";
      on-resume = "notify-send 'Welcome back!";
      }
      ];
    };
  };
}
