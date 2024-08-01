{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };

      label = [{
        monitor = "";
        text = "CA GAZPAR HAHAHA";
        color = "rgba(200, 200, 200, 1.0)";
        font_size = 25;
        font_family = "JetBrainsMono Nerd Font";
        position = "0, 150";
        halign = "center";
        valign = "left";
      }
      {
        monitor = "";
        text = "Hi there, $USER";
        color = "rgba(200, 200, 200, 1.0)";
        font_size = 40;
        font_family = "JetBrainsMono Nerd Font";
        position = "0, 150";
        halign = "center";
        valign = "center";
      }
      ];

      input-field = [ {
        monitor = "";
        size = "200, 200";
        outline_thickness = 2;
        dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = false;
        outer_color = "rgb(30, 30, 46)";
        inner_color = "rgb(180, 190, 245)";
        font_color = "rgb(30, 30, 46)";
        fade_on_empty = true;
        fade_timeout = 1000;
        placeholder_text = "<i>Input Password...</i>"; # Text rendered in the input box when it's empty.
        hide_input = true;

        position = "0, -20";
        halign = "center";
        valign = "center";
      }
      ];

      background = [ {
        monitor = "";
        # path = screenshot   # only png supported for now
        color = "rgba(30, 30, 46, 0.5)";

        # all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
        blur_passes = 1; # 0 disables blurring
        blur_size = 1;
        noise = 0.0117;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      }
      ];
    };
  };
}
