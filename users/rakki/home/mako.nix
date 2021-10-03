{ pkgs, config, nix-colors, ... }: {
  programs.mako = let colorscheme = config.colorscheme; in {
    enable = true;
    font = "Fira Sans 12";
    iconPath = "${pkgs.beauty-line-icon-theme}/share/icons/beauty-line";
    padding = "10,20";
    anchor = "top-center";
    width = 400;
    height = 80;
    borderSize = 2;
    output = "HDMI-A-1";
    defaultTimeout = 10000;
    backgroundColor = "#${colorscheme.colors.base00}dd";
    borderColor = "#${colorscheme.colors.base03}dd";
    textColor = "#${colorscheme.colors.base05}dd";

    extraConfig = ''
      text-alignment=center
    '';
  };
}
