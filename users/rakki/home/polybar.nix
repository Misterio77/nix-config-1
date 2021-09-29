{ pkgs, config, ... }: {
  services.polybar = {
    enable = true;
    script = "polybar mainbar & polybar mainbar2 &";
    package = pkgs.polybarFull;
    config = {
      "bar/mainbar" = {
        monitor = "\${env:MONITOR:HDMI-1}";
        width = "100%";
        height = 30;
        #offset-x = "1%";
        #offset-y = "1%";
        radius = "0.0";
        fixed-center = "true";

        #bottom = "true";

        background = "#ee17191E";
        foreground = "#8b9cbe";

        line-size = 3;
        line-color = "#f00";

        border-bottom = 3;
        border-color = "#3c3f4c";

        padding-left = 0;
        padding-right = 2;

        module-margin-left = 1;
        module-margin-right = 2;

        font-0 = "fixed:pixelsize=14;1";
        font-1 = "unifont:fontformat=truetype:size=14:antialias=false;1";
        font-2 = "siji:pixelsize=14;1";
        font-3 = "FiraCode Nerd Font:pixelsize=16;1";

        modules-left = "i3 filesystem network";
        modules-center = "xwindow";
        modules-right = "pulseaudio memory temperature cpu date";

        #tray-position = "right";
        #tray-padding = 2;
        #tray-background = "#ee17191E";

        wm-restack = "i3";

        override-redirect = "true";

        #scroll-up = "i3wm-wsnext";
        #scroll-down = "i3wm-wsprev";

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
      };
      "bar/mainbar2" = {
        monitor = "\${env:MONITOR:HDMI-0}";
        width = "100%";
        height = 30;
        #offset-x = "1%";
        #offset-y = "1%";
        radius = "0.0";
        fixed-center = "true";

        #bottom = "true";

        background = "#ee17191E";
        foreground = "#8b9cbe";

        line-size = 2;
        line-color = "#f00";

        border-bottom = 3;
        border-color = "#3c3f4c";

        padding-left = 0;
        padding-right = 2;

        module-margin-left = 1;
        module-margin-right = 2;

        font-0 = "fixed:pixelsize=13;1";
        font-1 = "unifont:fontformat=truetype:size=13:antialias=false;0";
        font-2 = "siji:pixelsize=13;1";
        font-3 = "FiraCode Nerd Font:pixelsize=15;1";

        modules-left = "i3 filesystem network";
        modules-center = "xwindow";
        modules-right = "pulseaudio memory temperature cpu date";

        tray-position = "right";
        tray-padding = 2;
        tray-background = "#ee17191E";

        wm-restack = "i3";

        override-redirect = "true";

        #scroll-up = "i3wm-wsnext";
        #scroll-down = "i3wm-wsprev";

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
     };
     "bar/tray" = {
       monitor = "\${env:MONITOR:HDMI-0}";
       width = "4%";
       height = 27;
       offset-x = "96%";
       offset-y = "3%";
       radius = "6.0";
       fixed-center = "false";

       #bottom = "true";

       background = "#ee17191E";
       foreground = "#8b9cbe";

       line-size = 2;
       line-color = "#f00";

       border-size = 4;
       border-color = "#00000000";

       padding-left = 0;
       padding-right = 2;

       module-margin-left = 1;
       module-margin-right = 2;

       font-0 = "fixed:pixelsize=10;1";
       font-1 = "unifont:fontformat=truetype:size=8:antialias=false;0";
       font-2 = "siji:pixelsize=10;1";

       modules-left = "empty";

       tray-position = "right";
       tray-padding = 0;
       #tray-background = "#0063ff";

       #wm-restack = "i3";

       override-redirect = "true";

       #scroll-up = "i3wm-wsnext";
       #scroll-down = "i3wm-wsprev";

       cursor-click = "pointer";
       cursor-scroll = "ns-resize";
     };
     "bar/cavabar" = {
       monitor = "\${env:MONITOR:HDMI-0}";
       width = "100%";
       height = 27;
       #offset-x = "1%";
       offset-y = "3%";
       radius = "6.0";
       fixed-center = "false";

       #bottom = "true";

       background = "#ee17191E";
       foreground = "#8b9cbe";

       line-size = 3;
       line-color = "#f00";

       border-size = 4;
       border-color = "#00000000";

       padding-left = 0;
       padding-right = 2;

       module-margin-left = 1;
       module-margin-right = 2;

       font-0 = "fixed:pixelsize=10;1";
       font-1 = "unifont:fontformat=truetype:size=8:antialias=false;0";
       font-2 = "siji:pixelsize=10;1";

       modules-left = "bigcava";

       #tray-position = "right";
       #tray-padding = 2;
       #tray-background = "#0063ff";

       #wm-restack = "i3";

       override-redirect = "true";

       #scroll-up = "i3wm-wsnext";
       #scroll-down = "i3wm-wsprev";

       cursor-click = "pointer";
       cursor-scroll = "ns-resize";
      };
      "module/filesystem" = {
        type = "internal/fs";
        interval = 25;

        mount-0 = "/nix";

        label-mounted = "%used%";
        label-mounted-foreground = "#8b9cbe";
        label-unmounted = "%mountpoint% not mounted";
        label-unmounted-foreground = "#ee17191E";
      };
    };
    extraConfig = ''
      # Start Flavours
      #[colors"
      #base00 = ee17191E
      #base01 = 22262d
      #base02 = 3c3f4c
      #base03 = 383a47
      #base04 = 555e70
      #base05 = 8b9cbe
      #base06 = B2BFD9
      #base07 = f4f4f7
      #base08 = ff29a8
      #base09 = 85ffe0
      #base0A = f0ffaa
      #base0B = 0badff
      #base0C = 8265ff
      #base0D = 00eaff
      #base0E = 00f6d9
      #base0F = ff3d81
      # End Flavours

      [module/minemis]
      type = custom/script
      exec = $HOME/.scripts/minemis/minemis
      click-left = notify-send $(mcstatus mc.misterio.me ping && mcstatus mc.misterio.me json | jq '.players[].name')
      click-right = telegram-cli -W -k -N server.pub -e "msg mis 'abre o server pora' && notify-send 'mensagem enviada'"
      tail = true

      [module/gamemode]
      type = custom/script
      exec = "gamemoded --status | grep 'is active' --quiet && echo '  '"

      [module/ethminer]
      type = custom/script
      exec = "(systemctl --user is-active --quiet ethminer && echo ﲹ $(journalctl --user -n 10 -u ethminer | grep -e '\ m\ .*' | cut -d ' ' -f12-13 | tail -1)) || echo"
      ;format-underline = #00f6d9

      [module/tray]
      type = custom/text
      content = ""
      click-left = ~/.scripts/polybar/traybar.sh
      click-right = ~/.scripts/polybar/kill-tray.sh

      [module/empty]
      type = custom/text
      content = "."
      click-left = polybar tray

      [module/nvidia-gpu]
      type = custom/script
      exec = nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{ print "龍 ",""$1"""%"}'
      interval = 2
      ;format-underline = #00f6d9
      click-left = systemctl --user start ethminer
      click-right = systemctl --user stop ethminer

      [module/bigcava]
      type = custom/script
      exec = ~/.scripts/polybar/cavabar/bigcava.sh
      tail = true

      [module/minicava]
      type = custom/script
      exec = ~/.scripts/polybar/cavabar/minicava.sh
      tail = true
      click-left = ~/.scripts/polybar/cavabar.sh
      click-right = ~/.scripts/polybar/kill-cava.sh

      [module/mpris]
      type = custom/script
      exec = ~/.scripts/mpris/player.sh
      label-maxlen = 40
      interval = 5

      [module/pacaur]
      type = custom/script
      exec = ~/.scripts/pacaur/updates-pacman-aur.sh
      interval = 600

      [module/xwindow]
      type = internal/xwindow
      label = %title%
      label-maxlen = 80
      label-empty =

      [module/xkeyboard]
      type = internal/xkeyboard
      blacklist-0 = num lock

      format-prefix = " "
      format-prefix-foreground = #8b9cbe
      ;format-prefix-underline = #ff3d81

      label-layout = %layout%
      ;label-layout-underline = #ff3d81

      label-indicator-padding = 2
      label-indicator-margin = 1
      label-indicator-background = #ff3d81
      ;label-indicator-underline = #ff3d81

      [module/i3]
      type = internal/i3
      format = <label-state> <label-mode>
      index-sort = false
      wrapping-scroll = false


      ; NERD FONT SYMBOLS WHEN FIXED: 綠 祿


      ; Only show workspaces on the same output as the bar
      pin-workspaces = true

      ; focused = Active workspace on focused monitor
      label-focused = %index%
      label-focused-background = #22262d
      label-focused-foreground = #8265ff
      ;label-focused-underline = #ff29a8
      label-focused-padding = 6

      ; unfocused = Inactive workspace on any monitor
      label-unfocused = %index%
      label-unfocused-padding = 6

      ; visible = Active workspace on unfocused monitor
      label-visible = %index%
      label-visible-background = #22262d
      label-visible-foreground = #8265ff
      ;label-visible-underline = #ff3d81
      label-visible-padding = 6

      ; urgent = Workspace with urgency hint set
      label-urgent = %index%
      label-urgent-background = #8265ff
      label-urgent-padding = 6

      ; Separator in between workspaces
      ; label-separator = |

      label-song-maxlen = 25
      label-song-ellipsis = true

      [module/cpu]
      type = internal/cpu
      interval = 2
      format-prefix = " "
      format-prefix-foreground = #8b9cbe
      ;format-underline = #f90000
      label = %percentage:2%%

      [module/memory]
      type = internal/memory
      interval = 2
      format-prefix = " "
      format-prefix-foreground = #8b9cbe
      ;format-underline = #4bffdc
      label = %mb_used%

      format-connected = <ramp-signal> <label-connected>
      #format-connected-underline = #9f78e1
      label-connected = %essid%

      format-disconnected =

      ramp-signal-0 = 
      ramp-signal-1 = 
      ramp-signal-2 = 
      ramp-signal-3 = 
      ramp-signal-4 = 
      ramp-signal-foreground = #8b9cbe

      [module/network]
      type = internal/network
      interface = enp3s0
      interval = 0.5

      label-connected = %downspeed% | %upspeed%
      label-connected-foreground = #8b9cbe
      label-disconnected = not connected
      ;label-disconnected-foreground = #66ffff
      format-packetloss = <animation-packetloss> <label-connected>

      accumulate-stats = true
      ping-interval = 3

      ; Only applies if <animation-packetloss> is used
      animation-packetloss-0 = ⚠
      animation-packetloss-0-foreground = #ffa64c
      animation-packetloss-1 = 📶
      animation-packetloss-1-foreground = #000000
      ; Framerate in milliseconds
      animation-packetloss-framerate = 500
      ;format-connected-underline = #55aa55
      ;format-disconnected-underline = #000000
      format-connected-prefix = "力  "
      format-connected-prefix-foreground = #8b9cbe

      [module/date]
      type = internal/date
      interval = 5

      date =
      date-alt = " %Y-%m-%d"

      time = %H:%M - %a - %d
      time-alt = %H:%M:%S %A

      format-prefix = " "
      format-prefix-foreground = #8265ff
      #format-underline = #8265ff
      format-background = #ee17191E

      label = %date% %time%

      [module/pulseaudio]
      type = internal/pulseaudio

      format-volume = <label-volume>
      label-volume = 墳  %percentage%%
      label-volume-foreground = #ee17191E
      ;format-volume-underline = #0badff

      label-muted = "       婢       "

      [module/temperature]
      type = internal/temperature
      thermal-zone = 2
      warn-temperature = 60

      format = <ramp> <label>
      ;format-underline = #f50a4d
      format-warn = <ramp> <label-warn>

      label = %temperature-c%
      label-warn = %temperature-c%
      label-warn-foreground = #00f6d9

      ramp-0 = 
      ramp-1 = 
      ramp-2 = 
      ramp-foreground = #8b9cbe

      #[module/powermenu]
      #type = custom/menu
      #
      #expand-right = true
      #
      #format-spacing = 1
      #
      #label-open = 
      #label-open-foreground = #ff3d81
      #label-close =  cancel
      #label-close-foreground = #ff3d81
      #label-separator = |
      #label-separator-foreground = #8b9cbe
      #
      #menu-0-0 = exit
      #menu-0-0-exec = menu-open-3
      #menu-0-1 = suspend
      #menu-0-1-exec = menu-open-4
      #menu-0-2 = reboot
      #menu-0-2-exec = menu-open-1
      #menu-0-3 = power off
      #menu-0-3-exec = menu-open-2

      #menu-1-0 = cancel
      #menu-1-0-exec = menu-open-0
      #menu-1-1 = reboot
      #menu-1-1-exec = sudo reboot
      #
      #menu-2-0 = power off
      #menu-2-0-exec = sudo shutdown
      #menu-2-1 = cancel
      #menu-2-1-exec = menu-open-0
      #
      #menu-3-0 = cancel
      #menu-3-0-exec = menu-open-0
      #menu-3-1 = exit
      #menu-3-1-exec = i3-msg exit
      #
      #menu-4-0 = cancel
      #menu-4-0-exec = menu-open-0
      #menu-4-1 = suspend
      #menu-4-1-exec = suspend, mode "default"

      [settings]
      screenchange-reload = true
      ;compositing-background = xor
      ;compositing-background = screen
      ;compositing-foreground = source
      ;compositing-border = over
      ;pseudo-transparency = false

      [global/wm]
      margin-top = 5
      margin-bottom = 5

      ; vim:ft=dosini
    '';
  };
}
