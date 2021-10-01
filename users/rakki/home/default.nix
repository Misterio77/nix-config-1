{ pkgs, config, ... }: {

  # Importar arquivos .nix
  imports = [
    ./starship.nix
    ./fish.nix
    ./nvim.nix
    ./neofetch.nix
    ./i3.nix
    ./sway.nix
    ./swaylock.nix
    ./swayidle.nix
    ./waybar.nix
    ./polybar.nix
    ./alacritty.nix
    ./dunst.nix
  ];

  # Persistência
  home.persistence = {
    "/data/home/rakki" = {
      # Permitir que o root acesse
      allowOther = true;
      # Pastas que você quer persistir
      directories = [
        # Pastas básicas
        "Documents"
        "Downloads"
        "Games"
        "Music"
        "Pictures"
        "Videos"
        ".scripts"

        # Pastas da steam
        #".steam"
        #".local/share/Steam"

        # Pastas do lutris
        ".config/lutris"
        ".local/share/lutris"

        # Dados do multimc
        ".local/share/multimc"

        # Pastas do discord
        ".config/discord"

        # Chaves do gpg
        ".gnupg"

        # Dados do kdeconnect
        ".config/kdeconnect"

        # Dados do osu
        ".local/share/osu"

        # Dados do pass
        ".local/share/password-store"

        # Chrome
        ".config/google-chrome"

       # Fish_history
       #".local/share/fish"

       # TODO: coloque aqui pastas de coisas que vc quer persistir
      ];

     # Persistir arquivos
     #files = [];
    };
  };

  home.sessionVariables = {
    TERMINAL = "alacritty";
    GTK_IM_MODULE = "cedilla";
    QT_IM_MODULE = "cedilla";
  };

  # Programas pro teu user que n tem um modulo do nix
  home.packages = with pkgs; [
    # Programas de terminal
    exa
    ranger
    dragon-drop
    bpytop
    bottom
    bat
    rsync
    gamemode
    udiskie
    escrotum
    octave
    libnotify
    killall
    xorg.xkill
    xclip
    cava
    ncdu
    imv

    # Programas de GUI
    google-chrome
    lutris
    #steam
    multimc
    discord
    osu-lazer
    opentabletdriver
    mpv
    rofi
    flameshot
    pavucontrol
    pulseeffects-legacy

    # Fontes
    # Fira Sans
    fira
    # Fira Code
    fira-code
    fira-code-symbols
    # Fira Code Nerd Font
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    # Siji
    siji
    # Unifont
    unifont
  ];
  # Registrar fontes instaladas
  fonts.fontconfig.enable = true;

  # Habilitar pass, com suporte a OTP
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
  };

  # Habilitar e configurar git
  programs.git = {
    enable = true;
    userName = "Fernando Marques";
    userEmail = "fernandomarques1505@gmail.com";
    signing = {
      signByDefault = true;
      key = "96FEAECF00C9EA0390CA35BF2A810BD6F5997B29";
    };
    extraConfig.init.defaultBranch = "main";
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    sshKeys = [ "DEAD5F7E7AA0BF26A2F59707D84E100417E1F3B2" ];
    pinentryFlavor = "gnome3";
  };

  # Usar tema do GTK no QT
  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  # GTK, fonte, icones e tema
  gtk = {
    enable = true;
    font = {
      name = "Fira Sans";
      size = 12;
    };
    iconTheme = {
      name = "BeautyLine";
      package = pkgs.beauty-line-icon-theme;
    };
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
  };

}
