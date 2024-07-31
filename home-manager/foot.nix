{
  inputs,
  pkgs,
  ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono NerdFont:size = 14";
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
