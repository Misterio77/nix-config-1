{ config, ... }: {
  xdg.configFile."swaylock/config".text = ''
    screenshots
    daemonize
    effect-blur=10x10
    effect-greyscale
    fade-in=0.5

    indicator-radius=50
    indicator-y-position=1000

    inside-color=#292828
    ring-color=#333131
    key-hl-color=#b30452
    '';
}
