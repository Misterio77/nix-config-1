{ config, nix-colors, ... }:

let colorscheme = config.colorscheme;
in {
  xdg.configFile."swaylock/config".text = ''
    screenshots
    daemonize
    effect-blur=10x10
    effect-greyscale
    fade-in=0.5

    indicator-radius=50
    indicator-y-position=1000

    ring-color=#${colorscheme.colors.base02}
    inside-wrong-color=#${colorscheme.colors.base08}
    ring-wrong-color=#${colorscheme.colors.base08}
    key-hl-color=#${colorscheme.colors.base0B}
    bs-hl-color=#${colorscheme.colors.base08}
    ring-ver-color=#${colorscheme.colors.base09}
    inside-ver-color=#${colorscheme.colors.base09}
    inside-color=#${colorscheme.colors.base01}
    text-color=#${colorscheme.colors.base07}
    text-clear-color=#${colorscheme.colors.base01}
    text-ver-color=#${colorscheme.colors.base01}
    text-wrong-color=#${colorscheme.colors.base01}
    text-caps-lock-color=#${colorscheme.colors.base07}
    inside-clear-color=#${colorscheme.colors.base0C}
    ring-clear-color=#${colorscheme.colors.base0C}
    inside-caps-lock-color=#${colorscheme.colors.base09}
    ring-caps-lock-color=#${colorscheme.colors.base02}
    separator-color=#${colorscheme.colors.base02}
    '';
}
