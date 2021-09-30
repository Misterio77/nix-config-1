{ pkgs, config, ... }:
let
  base00 = "17172b";
  base01 = "1b1c36";
  base02 = "30365F";
  base03 = "686f9a";
  base04 = "818596";
  base05 = "ecf0c1";
  base06 = "c1c3cc";
  base07 = "ffffff";
  base08 = "e33400";
  base09 = "e39400";
  base0A = "f2ce00";
  base0B = "5ccc96";
  base0C = "00a3cc";
  base0D = "7a5ccc";
  base0E = "b3a1e6";
  base0F = "ce6f8f";
in rec {
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      height = 36;
      position = "top";
      modules-left = [
        "sway/workspaces"
        "disk"
        "network"
      ];
      modules-center = [ "sway/window" ];
      modules-right = [
        "pulseaudio"
        "memory"
        "cpu"
        "temperature"
        "clock"
        "tray"
      ];
      modules = {
        clock = {
          format = "{:%H:%M - %a - %d} ";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
          interval = 3;
        };
        memory = {
          format = "{used:0.2f}G ";
          tooltip-format = "Used {used:0.3f}G of {total:0.3f}G | {percentage}%";
          interval = 3;
        };
        disk = {
          interval = 30;
          path = "/nix";
          format = "{used}";
        };
        network = {
          interval = 1;
          format = "{bandwidthDownBits} | {bandwidthUpBits}";
          format-disconnected = "";
          tooltip-format = "{ipaddr}";
        };
        pulseaudio = {
          format = "{volume}% 墳";
          format-muted = "婢   ";
          scroll-step = 5.0;
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          on-click-right = "pavucontrol";
        };
        temperature = {
          thermal_zone = 2;
          format = "{temperatureC}°C ";
          format-critical = "{temperatureC}°C_*critical*";
          critical-threshold = 80;
        };
        tray = {
          icon-size = 21;
          spacing = 8;
        };
        "sway/window" = { max-lenght = 40; };
        "sway/workspaces" = {
          format = "{icon} {name}";
          format-icons = {
            focused = "綠  ";
            default = "祿  ";
        };
      };
    };
  }];
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: Fira Sans, Fira Code NerdFont;
        font-size: 12pt;
        margin: 1px 0;
        padding: 0 8px;
      }

      window#waybar {
        color: #${base05};
        background-color: #${base00};
        border-bottom: 2px solid #${base0C};
      }

      #workspaces button.visible {
      background-color: #${base02};
      color: #${base04};
      }

    '';
  };
}
