{ pkgs, config, ... }: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_width = 2;
        font = "monospace bold 3";
        markup = "full";
        format = "%s %p\n%b";
        sort = "yes";
        indicate_hidden = "no";
        corner_radius = 0;
        alignment = "center";
        bounce_freq = 5;
        mouse_left_click = "do_action";
        mouse_right_click = "close_current";
        show_age_threshold = 60;
        word_wrap = "false";
        ignore_newline = "no";
        geometry = "500x5-720+40";
        shrink = "false";
        transparency = 5;
        idle_threshold = 900;
        monitor = 1;
        follow = "none";
        sticky_history = "yes";
        history_length = 20;
        show_indicators = "yes";
        line_height = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        startup_notification = "false";
        dmenu = "${pkgs.dmenu}/bin/dmenu -p dunst";
        browser = "${pkgs.google-chrome}/bin/google-chrome-stable";
        icon_position = "left";
        icon_path = "";
        max_icon_size=32;
      };
      base16_low = {
        msg_urgency = "low";
        background = "#1b1c36";
        foreground = "#686f9a";
      };
      base16_normal = {
        msg_urgency = "normal";
        background = "#30365F";
        foreground = "#ecf0c1";
      };
      base16_urgency = {
        msg_urgency = "critical";
        background = "#e33400";
        foreground = "#c1c3cc";
      };
      urgency_low = {
        timeout = 10;
        background = "#153238";
        foreground = "#aaaaaa";
      };
      urgency_normal = {
        timeout = 10;
        background = "#263238";
        foreground = "#aaaaaa";
      };
      urgency_critical = {
        timeout = 0;
        background = "#a19879";
        foreground = "#F9FAF9";
      };
    };
  };
}
