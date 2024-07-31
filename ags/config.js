const Hyprland = await Service.import("hyprland");
const Network = await Service.import("network");
const Notifications = await Service.import("notifications");
import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import Battery from "resource:///com/github/Aylur/ags/service/battery.js";
const SystemTray = await Service.import("systemtray");
import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { exec, execAsync } from "resource:///com/github/Aylur/ags/utils.js";
import Powermenu from "./powermenu/Powermenu.js";

// widgets can be only assigned as a child in one container
// so to make a reuseable widget, make it a function
// then you can simply instantiate one by calling it

const names = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十"];
const Workspaces = () =>
  Widget.Box({
    class_name: "workspaces",
    children: Array.from({ length: 10 }, (_, i) => i + 1).map((i) =>
      Widget.Button({
        on_clicked: () => Hyprland.message(`dispatch workspace ${i}`),
        child: Widget.Label(names[i - 1]),
        attribute: i,
      }),
    ),
    setup: (self) =>
      self.hook(Hyprland, () =>
        self.children.forEach((btn) => {
          btn.class_name = Hyprland.workspaces.some(
            (ws) => ws.id === btn.attribute,
          )
            ? "used"
            : "";
          if (btn.attribute === Hyprland.active.workspace.id) {
            btn.class_name = "active";
          }
        }),
      ),
  });

const ClientTitle = () =>
  Widget.Label({
    class_name: "client-title",
    label: Hyprland.active.client.bind("title"),
  });

const Clock = () =>
  Widget.Label({
    class_name: "clock",
    setup: (self) =>
      self
        // this is bad practice, since exec() will block the main event loop
        // in the case of a simple date its not really a problem
        //.poll(1000, (self) => (self.label = exec('date "+%H:%M %b %e."')))

        // this is what you should do
        .poll(1000, (self) =>
          execAsync(["date", "+%H:%M %b %e."]).then(
            (date) => (self.label = date),
          ),
        ),
  });

// we don't need dunst or any other notification daemon
// because the Notifications module is a notification daemon itself
const Notification = () =>
  Widget.Box({
    class_name: "notification",
    visible: Notifications.bind("popups").transform((p) => p.length > 0),
    children: [
      Widget.Icon({
        icon: "preferences-system-notifications-symbolic",
      }),
      Widget.Label({
        label: Notifications.bind("popups").transform(
          (p) => p[0]?.summary || "",
        ),
      }),
    ],
  });

const Media = () =>
  Widget.Button({
    class_name: "media",
    on_primary_click: () => Mpris.getPlayer("")?.playPause(),
    on_scroll_up: () => Mpris.getPlayer("")?.next(),
    on_scroll_down: () => Mpris.getPlayer("")?.previous(),
    child: Widget.Label("-").hook(
      Mpris,
      (self) => {
        if (Mpris.players[0]) {
          const { track_artists, track_title } = Mpris.players[0];
          self.label = `${track_artists.join(", ")} - ${track_title}`;
        } else {
          self.label = "Nothing is playing";
        }
      },
      "player-changed",
    ),
  });

const Volume = () =>
  Widget.Box({
    class_name: "volume",
    css: "min-width: 180px",
    children: [
      Widget.Button({
        onClicked: () => (Audio.speaker.is_muted = !Audio.speaker.is_muted),
        child: Widget.Icon().hook(
          Audio,
          (self) => {
            if (!Audio.speaker) return;

            const category = {
              101: "overamplified",
              67: "high",
              34: "medium",
              1: "low",
              0: "muted",
            };

            const icon = Audio.speaker.is_muted
              ? 0
              : [101, 67, 34, 1, 0].find(
                  (threshold) => threshold <= Audio.speaker.volume * 100,
                );

            self.icon = `audio-volume-${category[icon]}-symbolic`;
          },
          "speaker-changed",
        ),
      }),
      Widget.Slider({
        hexpand: true,
        draw_value: false,
        on_change: ({ value }) => (Audio.speaker.volume = value),
        setup: (self) =>
          self.hook(
            Audio,
            () => {
              self.value = Audio.speaker?.volume || 0;
            },
            "speaker-changed",
          ),
      }),
    ],
  });

const BatteryLabel = () =>
  Widget.Box({
    class_name: "battery",
    visible: Battery.bind("available"),
    children: [
      Widget.Icon({
        class_name: "bat-icon",
        icon: Battery.bind("percent").transform((p) => {
          let percent = Math.floor(p / 10) * 10;
          if (Battery.charging) {
            if (percent >= 100) {
              return "battery-level-100-charged-symbolic";
            }
            return `battery-level-${percent}-charging-symbolic`;
          }
          return `battery-level-${percent}-symbolic`;
        }),
      }),
      Widget.Label({
        label: Battery.bind("percent").as((percent) => `${percent}%`),
      }),
    ],
  });

/** @param {import('types/service/systemtray').TrayItem} item */
const SysTrayItem = (item) =>
  Widget.Button({
    child: Widget.Icon().bind("icon", item, "icon"),
    tooltipMarkup: item.bind("tooltip_markup"),
    onPrimaryClick: (_, event) => item.activate(event),
    onSecondaryClick: (_, event) => item.openMenu(event),
  });

const SysTray = () =>
  Widget.Box({
    children: SystemTray.bind("items").transform((i) => i.map(SysTrayItem)),
  });

const Resal = () =>
  Widget.EventBox({
    class_name: "resal",
    child: Widget.Box({
      children: [
        Widget.Icon({
          icon: Network.wifi.bind("icon_name"),
        }),
      ],
    }),
  });

// layout of the bar
const Left = () =>
  Widget.Box({
    spacing: 8,
    children: [Workspaces()],
  });

const Center = () =>
  Widget.Box({
    spacing: 8,
    children: [Media(), Notification()],
  });

const Right = () =>
  Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [Volume(), BatteryLabel(), Clock(), Resal(), SysTray()],
  });

const Bar = (monitor = 0) =>
  Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });

import { monitorFile } from "resource:///com/github/Aylur/ags/utils.js";

monitorFile(`${App.configDir}/style.css`, function () {
  App.resetCss();
  App.applyCss(`${App.configDir}/style.css`);
});

// exporting the config so ags can manage the windows
App.config({
  style: App.configDir + "/style.css",
  windows: [
    Bar(),
    Powermenu(),

    // you can call it, for each monitor
    // Bar(0),
    // Bar(1)
  ],
});
