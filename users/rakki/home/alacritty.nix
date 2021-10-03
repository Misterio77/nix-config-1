{ config, nix-colors, ... }: {
  programs = let colorscheme = config.colorscheme; in {
    alacritty = {
      enable = true;
      settings = {
        colors = {
          primary = {
            background = "#${colorscheme.colors.base00}";
            foreground = "#${colorscheme.colors.base05}";
          };
          cursor = {
            background = "#${colorscheme.colors.base00}";
            foreground = "#${colorscheme.colors.base05}";
          };
          normal = {
            black = "#${colorscheme.colors.base00}";
            red = "#${colorscheme.colors.base08}";
            green = "#${colorscheme.colors.base08}";
            yellow = "#${colorscheme.colors.base0A}";
            blue = "#${colorscheme.colors.base0D}";
            magenta = "#${colorscheme.colors.base0E}";
            cyan = "#${colorscheme.colors.base0C}";
            white = "#${colorscheme.colors.base05}";
          };
          bright = {
            black = "#${colorscheme.colors.base03}";
            red = "#${colorscheme.colors.base08}";
            green = "#${colorscheme.colors.base08}";
            yellow = "#${colorscheme.colors.base0A}";
            blue = "#${colorscheme.colors.base0D}";
            magenta = "#${colorscheme.colors.base0E}";
            cyan = "#${colorscheme.colors.base0C}";
            white = "#${colorscheme.colors.base07}";
          };
          indexed_colors = [
            {
              index = 16;
              color = "#${colorscheme.colors.base09}";
            }
            {
              index = 17;
              color = "#${colorscheme.colors.base0F}";
            }
            {
              index = 18;
              color = "#${colorscheme.colors.base01}";
            }
            {
              index = 19;
              color = "#${colorscheme.colors.base02}";
            }
            {
              index = 20;
              color = "#${colorscheme.colors.base04}";
            }
            {
              index = 21;
              color = "#${colorscheme.colors.base06}";
            }
          ];
        };
        window = {
          font = {
            size = 12.0;
            normal.family = "FiraCode Nerd Font";
          };
        };
      };
    };
  };
}
