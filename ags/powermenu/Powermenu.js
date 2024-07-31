import { exec, execAsync } from "resource:///com/github/Aylur/ags/utils.js";
import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import * as Utils from "resource:///com/github/Aylur/ags/utils.js";

const iconSize = 120;

const menu = Widget.Box({
  hpack: "center",
  vpack: "center",
  children: [
    Widget.Button({
      on_clicked: () => Utils.exec("shutdown now"),
      hexpand: true,
      vexpand: true,
      className: "powermenu-buttons",
      child: Widget.Icon({
        icon: "system-shutdown-symbolic",
        size: iconSize,
      }),
    }),
    Widget.Button({
      on_clicked: () => Utils.exec("reboot"),
      hexpand: true,
      vexpand: true,
      className: "powermenu-buttons",
      child: Widget.Icon({
        icon: "system-reboot-symbolic",
        size: iconSize,
      }),
    }),
    Widget.Button({
      on_clicked: () => Utils.exec("pkill Hyprland"),
      hexpand: true,
      vexpand: true,
      className: "powermenu-buttons",
      child: Widget.Icon({
        icon: "system-log-out-symbolic",
        size: iconSize,
      }),
    }),
    Widget.Button({
      on_clicked: () =>
        Utils.execAsync("hyprlock")
          .then((out) => print(out))
          .catch((err) => print(err)),
      hexpand: true,
      vexpand: true,
      className: "powermenu-buttons",
      child: Widget.Icon({
        icon: "changes-prevent-symbolic",
        size: iconSize,
      }),
    }),
  ],
});

export default () =>
  Widget.Window({
    name: "powermenu",
    exclusivity: "ignore",
    layer: "overlay",
    visible: false,
    keymode: "exclusive",
    child: Widget.Box({
      className: "powermenu",
      children: [
        Widget.Box({
          className: "powermenu-box",
          children: [menu],
        }),
      ],
    }),
  });
