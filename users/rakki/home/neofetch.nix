{ pkgs, ... }: {
  home.packages = [ pkgs.neofetch ];
  xdg.configFile."neofetch/config.conf".text = ''
          print_info() {
          info title
          info underline
          info "OS" distro
          info "Kernel" kernel
          info "Uptime" uptime
          info "Packages" packages
          prin "Shell" "fish"
          info "WM" wm
          info "Theme" theme
          info "Terminal" term
          info "Terminal Font" term_font
          info underline
          prin "Motherboard" "$(< /sys/devices/virtual/dmi/id/board_name)"
          info "CPU" cpu
          prin "GPU" "$(nvidia-smi -L | cut -d ':' -f2 | cut -d '(' -f1) ($(nvidia-smi | grep Default | cut -d D -f1 | cut -d '|' -f4))"
          info "Memory" memory
          info "Disk" disk

          info cols
      }

      ascii_bold="on"
      ascii_colors=(distro)
      ascii_distro="auto"
      background_color=
      bar_border="on"
      bar_char_elapsed="-"
      bar_char_total="="
      bar_color_elapsed="distro"
      bar_color_total="distro"
      bar_length=15
      battery_display="off"
      block_height=1
      block_range=(0 15)
      block_width=3
      bold="on"
      col_offset="auto"
      color_blocks="on"
      colors=(distro)
      cpu_brand="on"
      cpu_cores="logical"
      cpu_display="off"
      cpu_speed="on"
      cpu_temp="on"
      crop_mode="normal"
      crop_offset="center"
      de_version="off"
      disk_display="off"
      disk_percent="on"
      disk_show=('/' '/nix')
      disk_subtitle="mount"
      distro_shorthand="off"
      gap=3
      gpu_brand="on"
      gpu_type="all"
      gtk2="on"
      gtk3="on"
      gtk_shorthand="on"
      image_backend="ascii"
      image_loop="off"
      image_size="auto"
      image_source="auto"
      kernel_shorthand="on"
      memory_display="off"
      memory_percent="on"
      mpc_args=()
      music_player="auto"
      os_arch="off"
      package_managers="on"
      public_ip_host="http://ident.me"
      public_ip_timeout=2
      refresh_rate="on"
      separator=":"
      shell_path="off"
      shell_version="on"
      song_format="%artist% - %album% - %title%"
      song_shorthand="off"
      speed_shorthand="on"
      speed_type="scaling_max_freq"
      stdout="off"
      title_fqdn="off"
      underline_char="-"
      underline_enabled="on"
      uptime_shorthand="on"
      xoffset=0
    yoffset=0
  '';
}
