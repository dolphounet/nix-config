{
  inputs,
  pkgs,
  ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
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
