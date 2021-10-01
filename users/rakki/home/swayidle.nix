{ pkgs, config, ... }:
let
  swaylock = "${pkgs.swaylock-effects}/bin/swaylock";
  pactl = "${pkgs.pulseaudio}/bin/pactl";
  pgrep = "${pkgs.procps}/bin/pgrep";
in {
  xdg.configFile."swayidle/config".text = ''
    timeout 300 '${swaylock} -S -f'

    timeout 10  '${pgrep} -x swaylock && ${pactl} set-source-mute @DEFAULT_SOURCE@ yes' resume  '${pgrep} -x swaylock && ${pactl} set-source-mute @DEFAULT_SOURCE@ no'
    timeout 310 '${pactl} set-source-mute @DEFAULT_SOURCE@ yes' resume '${pactl} set-source-mute @DEFAULT_SOURCE@ no'

    timeout 20  '${pgrep} -x swaylock && swaymsg "output * dpms off"' resume  '${pgrep} -x swaylock && swaymsg "output * dpms on"'
    timeout 620 'swaymsg "output * dpms off"' resume  'swaymsg "output * dpms on"'
  '';
}
