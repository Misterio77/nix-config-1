{ config, ... }: {
  programs = {
    alacritty = {
      enable = true;
      settings = {
        window = {
          font = {
            size = 12.0;
            normal.family = "FiraCode Nerd Font";
            colors = {
              primary = {
                background = "0x16172d";
                foreground = "0xecf0c1";
              };
              normal = {
                black = "0x16172d";
                red = "0xe33400";
                green = "0x5ccc96";
                yellow = "0xf2ce00";
                blue = "0x7a5ccc";
                magenta = "0xb3a1e6";
                cyan = "0x00a3cc";
                white = "0xecf0c1";
              };
              bright = {
                black = "0x686f9a";
                red = "0xe33400";
                green = "0x5ccc96";
                yellow = "0xf2ce00";
                blue = "0x7a5ccc";
                magenta = "0xb3a1e6";
                cyan = "0x00a3cc";
                white = "0xffffff";
              };
              indexed_colors = [
                {
                  index = 16;
                  color = "0xe39400";
                }
                {
                  index = 17;
                  color = "0xce6f8f";
                }
                {
                  index = 18;
                  color = "0x1b1c36";
                }
                {
                  index = 19;
                  color = "0x30365F";
                }
                {
                  index = 20;
                  color = "0x818596";
                }
                {
                  index = 21;
                  color = "0xc1c3cc";
                }
              ];
            };
          };
        };
      };
    };
  };
}