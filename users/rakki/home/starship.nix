{ config, ... }: {
  programs.starship = {
  enable = true;
  settings = {
    add_newline = true;
    command_timeout = 20000;
    line_break = {
      disable = false;
    };
    package = {
      disabled = false;
    };
    username = {
      show_always = true;
      disabled = false;
      style_user = "bold #7A5FEE";
      format = "[$user]($style)@";
    };
    hostname = {
      ssh_only = false;
      disabled = false;
      style = "bold #c41b5c";
      format = "[$hostname]($style) in ";
    };
    cmd_duration = {
      disabled = false;
      min_time = 0;
      show_milliseconds = true;
      style = "bold #7A5FEE";
      format = "took [$duration]($style) ";
    };
    time = {
      disabled = false;
      style = "bold #56319e";
    };
  };
};
}
