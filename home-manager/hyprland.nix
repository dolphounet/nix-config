{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      monitor = ",preferred,auto,1.5";
      exec-once = [
        "wl-paste --watch cliphist store"
        "fcitx5"
        "hypridle"
        "hyprpaper"
        "ags"
        "hyprctl setcursor Catppuccin-Mocha-Lavender-Cursors 32"
      ];
      xwayland = {
        force_zero_scaling = true;
      };

      input = {
        kb_layout = "fr";
        follow_mouse = 1;
        numlock_by_default = true;
        touchpad = {
          natural_scroll = "yes";
        };
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 0;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 4;
        blur = {
          enabled = true;
          popups = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "yes";
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "anim, 0, 1, 0.5, 0.85"
        ];
        animation = [
          "windows, 1, 4, anim"
          "windowsOut, 1, 1, myBezier, popin 80%"
          "windowsMove, 1, 5, anim"
          "border, 1, 10, myBezier"
          "borderangle, 1, 8, myBezier"
          "fade, 1, 4, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      gestures = {
        workspace_swipe = "off";
      };

      windowrule = [
        "tile, ^(MATLAB R2023b - academic use)$"
      ];

      windowrulev2 = [
        "tile,class:^(MATLAB R2023b - academic use)$,title:^(MATLAB R2023b - academic use)$"
        "float, title:^(Picture-in-Picture)$"
        "tile, class:^(de-neemann-digital-gui-Main)$, title:^(Digital)$"
      ];

      layerrule = [
        "blur, ^(.*)$"
        "ignorezero, ^(.*)$"
      ];

      misc = {
        disable_hyprland_logo = true;
        vrr = 1;
        enable_swallow = true;
        swallow_regex = "^(foot)$";
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
      };

      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, Q, exec, foot"
        "$mainMod, C, killactive,"
        "$mainMod, E, exec, pcmanfm"
        "$mainMod, f, togglefloating,"
        "$mainMod, P, pseudo,"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "$mainMod SHIFT, s, exec, hyprctl keyword monitor ,preferred,auto,1 && IMG = ~/Images/$(date +%Y-%m-%d_%H-%M-%S).png && grim -g '$(slurp)' $IMG && wl-copy < $IMG && hyprctl keyword monitor ,preferred,auto,1.5"
        "$mainMod, x, exec, ags -t powermenu"
        "$mainMod, v, exec, cliphist list | wofi --show dmenu | cliphist decode | wl-copy"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, ampersand, workspace, 1"
        "$mainMod, eacute, workspace, 2"
        "$mainMod, quotedbl, workspace, 3"
        "$mainMod, apostrophe, workspace, 4"
        "$mainMod, parenleft, workspace, 5"
        "$mainMod, minus, workspace, 6"
        "$mainMod, egrave, workspace, 7"
        "$mainMod, underscore, workspace, 8"
        "$mainMod, ccedilla, workspace, 9"
        "$mainMod, agrave, workspace, 10"

        "$mainMod SHIFT, ampersand, movetoworkspace, 1"
        "$mainMod SHIFT, eacute, movetoworkspace, 2"
        "$mainMod SHIFT, quotedbl, movetoworkspace, 3"
        "$mainMod SHIFT, apostrophe, movetoworkspace, 4"
        "$mainMod SHIFT, parenleft, movetoworkspace, 5"
        "$mainMod SHIFT, minus, movetoworkspace, 6"
        "$mainMod SHIFT, egrave, movetoworkspace, 7"
        "$mainMod SHIFT, underscore, movetoworkspace, 8"
        "$mainMod SHIFT, ccedilla, movetoworkspace, 9"
        "$mainMod SHIFT, agrave, movetoworkspace, 10"
        ", F11, fullscreen"
      ];
      binde = [
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", Next, exec, brightnessctl -d asus::kbd_backlight set 1-"
        ", Prior, exec, brightnessctl -d asus::kbd_backlight set +1"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindri = [
        "$mainMod, SUPER_L, exec, pkill wofi || wofi --show drun"
      ];
    };
  };
  home.packages = with pkgs; [
    grim
    slurp
    cliphist
  ]
}
