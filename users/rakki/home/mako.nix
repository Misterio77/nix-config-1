{ pkgs, config, ... }: {
  programs.mako = {
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
    backgroundColor = "#1b1c36dd";
    borderColor = "#c1c3ccdd";
    textColor = "#686f9add";

    extraConfig = ''
      text-alignment=center
    '';
  };
}
