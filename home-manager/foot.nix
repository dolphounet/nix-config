{
  inputs,
  pkgs,
  ...
}: {
  programs.foot = {
    enable = true;
    catppuccin.enable = false;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        include = "/home/maxence/nix-config/foot/tokyonight-storm";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      cursor = {
        style = "beam";
        unfocused-style = "none";
        blink = "yes";
      };
    };
  };
}
