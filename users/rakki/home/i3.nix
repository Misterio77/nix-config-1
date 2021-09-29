{ lib, pkgs, config, ... }: {
  # Habilitar e configurar i3
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = rec {
        bars = [];
        startup = [
          { command = "xrandr --output HDMI-1 --mode '1920x1080' --pos 1920x130 --primary"; notification = false; }
          { command = "${pkgs.feh}/bin/feh --bg-scale -z ~/Pictures/Wallpapers/aesthetic/aesthetic_wallpaper.png"; notification = false; }
          { command = "setxkbmap -layout us -variant intl"; notification = false; }
          #{ command = "$HOME/Documents/polybar/launch.sh"; always = true; notification = false; }
        ];
        modifier = "Mod4";
        workspaceLayout = "default";
        workspaceAutoBackAndForth = true;
        window = {
          border = 2;
        };
        terminal = "alacritty";
        menu = "${pkgs.rofi}/bin/rofi";
        gaps = {
          top = 20;
          bottom = 0;
          outer = 12;
          inner = 8;
        };
        keybindings =
          let
            modifier = config.xsession.windowManager.i3.config.modifier;
          in lib.mkOptionDefault {
            "${modifier}+Return" = "exec ${terminal}"; #TODO: como coloca pra usar a variavel "terminal"?
            "${modifier}+Shift+q" = "kill";
            "${modifier}+d" = "exec $HOME/.scripts/rofi/run.sh";
            "${modifier}+Ctrl+Shift+a" = "exec $HOME/.scripts/autoclick/autoclick.sh";
            "${modifier}+f2" = "exec google-chrome-stable";
            "${modifier}+Shift+e" = "exec nautilus";
            "${modifier}+c" = "exec alacritty -t 'Octave' --class AlacrittyFloatingOctave --command octave";
            "${modifier}+Shift+f" = "exec kdeconnect-app";
            "${modifier}+l" = "exec $HOME/.scripts/i3lock.sh";
            #FIXME: "${modifier}+0" = "exec $HOME/.scripts/power/power";
            "Print" = "exec $HOME/.scripts/escrotum/escrotum";
            "Shift+Print" = "exec flameshot gui";
            "${modifier}+Shift+Return" = "exec alacritty -t 'fish' --class AlacrittyFloatingOctave";
            # audio
            #FIXME"Shift+XF86AudioMute" = "exec pactl set-default-sink alsa_output.usb-Logitech_Logitech_G633_Gaming_Headset_00000000-00.analog-stereo";
            #FIXME"Shift+XF86AudioLowerVolume" = "exec pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo";
            #FIXME"Shift+XF86AudioRaiseVolume" = "exec pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo";
            "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
            "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
            "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
            "Ctrl+m" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
            "${modifier}+Ctrl+m" = "exec pavucontrol";
            "${modifier}+Ctrl+Shift+m" = "exec pulseeffects";
            "${modifier}+Ctrl+x" = "--release exec xkill";
            "${modifier}+q" = "split toggle";
            "${modifier}+minus" = "move scratchpad";
            "${modifier}+equal" = "scratchpad show";
            # workspaces
            "${modifier}+1" = "workspace 1";
            "${modifier}+2" = "workspace 2";
            "${modifier}+3" = "workspace 3";
            "${modifier}+4" = "workspace 4";
            "${modifier}+5" = "workspace 5";
            "${modifier}+6" = "workspace 6";
            "${modifier}+7" = "workspace 7";
            "${modifier}+8" = "workspace 8";
            "${modifier}+9" = "workspace 9";
            # move containers
            "${modifier}+Ctrl+1" = "move container to workspace 1";
            "${modifier}+Ctrl+2" = "move container to workspace 2";
            "${modifier}+Ctrl+3" = "move container to workspace 3";
            "${modifier}+Ctrl+4" = "move container to workspace 4";
            "${modifier}+Ctrl+5" = "move container to workspace 5";
            "${modifier}+Ctrl+6" = "move container to workspace 6";
            "${modifier}+Ctrl+7" = "move container to workspace 7";
            "${modifier}+Ctrl+8" = "move container to workspace 8";
            "${modifier}+Ctrl+9" = "move container to workspace 9";
            # move container and workspace
            "${modifier}+Shift+1" = "move container to workspace 1; workspace 1";
            "${modifier}+Shift+2" = "move container to workspace 2; workspace 2";
            "${modifier}+Shift+3" = "move container to workspace 3; workspace 3";
            "${modifier}+Shift+4" = "move container to workspace 4; workspace 4";
            "${modifier}+Shift+5" = "move container to workspace 5; workspace 5";
            "${modifier}+Shift+6" = "move container to workspace 6; workspace 6";
            "${modifier}+Shift+7" = "move container to workspace 7; workspace 7";
            "${modifier}+Shift+8" = "move container to workspace 8; workspace 8";
            "${modifier}+Shift+9" = "move container to workspace 9; workspace 9";
        };
      };
      extraConfig = ''
        # i3 config file /\ By Fernando Marques

        # Start Flavours
        ## Base16 Spaceduck
        # Author: Guillermo Rodriguez (https://github.com/pineapplegiant), packaged by Gabriel Fontes (https://github.com/Misterio77)
        #
        # You can use these variables anywhere in the i3 configuration file.

        set $base00 #16172d
        set $base01 #1b1c36
        set $base02 #30365F
        set $base03 #686f9a
        set $base04 #818596
        set $base05 #ecf0c1
        set $base06 #c1c3cc
        set $base07 #ffffff
        set $base08 #e33400
        set $base09 #e39400
        set $base0A #f2ce00
        set $base0B #5ccc96
        set $base0C #00a3cc
        set $base0D #7a5ccc
        set $base0E #b3a1e6
        set $base0F #ce6f8f
        # End Flavours


        # Open specific applications in floating mode
        for_window [title="alsamixer"] floating enable border pixel 1
        for_window [class="Clipgrab"] floating enable
        for_window [title="File Transfer*"] floating enable
        for_window [title="*event started"] floating enable
        for_window [title="GWE*"] floating enable
        for_window [title="NVIDIA X Server Settings"] floating enable
        for_window [class="GParted"] floating enable border normal
        for_window [title="i3_help"] floating enable sticky enable border normal
        for_window [instance="AlacrittyFloatingSelector"] floating enable, resize set 500 100, move position center
        for_window [instance="AlacrittyFloatingPower"] floating enable, resize set 500 150, move position center
        for_window [instance="AlacrittyFloatingOctave"] floating enable
        for_window [title="Steam Guard - Computer Authorization Required"] floating enable
        for_window [title="Raindrop.io*"] floating enable
        for_window [class="Lxappearance"] floating enable sticky enable border normal
        for_window [class="Nitrogen"] floating enable sticky enable border normal
        for_window [class="Pavucontrol"] floating enable
        for_window [title="PulseEffects"] floating enable
        for_window [class="(?i)virtualbox"] floating enable border normal
        for_window [title="Pudimcoin Core - Carteira"] floating enable
        for_window [title="Upload*"] floating enable
        for_window [instance="origin.exe"] move scratchpad
        for_window [title="Origin"] move scratchpad

        # Theme colors
        # class                   border  backgr. text    indic.   child_border
        client.focused           $base0B $base00 $base05 $base09 $base0B
        client.unfocused         $base02 $base00 $base04 $base02 $base02
        client.focused_inactive  $base01 $base00 $base04 $base01 $base01
        client.urgent            $base0C $base00 $base04 $base0C $base0C

        client.background        #2B2C2B

         # Workspace names
        # to display names or symbols instead of plain workspace numbers you can use
        # something like: set $ws1 1:mail
        #                 set $ws2 2:
        set $ws1 1:1
        set $ws2 2:2
        set $ws3 3:3
        set $ws4 4:4
        set $ws5 5:5
        set $ws6 6:6
        set $ws7 7:7
        set $ws8 8:8
        set $ws9 9:9
      '';
    };
  };
  services.screen-locker = {
    enable = true;
    inactiveInterval = 30;
    lockCmd = "${pkgs.i3lock-color}/bin/i3lock-color -B sigma --inside-color=292828 --ring-color=333131 --keyhl-color=b30452 --date-color=b30452 --time-color=3d138a --ind-pos='2900:700' --radius=50 --time-size=15 --date-size=10 --ring-width=7";
  };
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
}
