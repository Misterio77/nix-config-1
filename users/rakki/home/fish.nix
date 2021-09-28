{ pkgs, config, ... }: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      # nix
      rnix = "sudo nixos-rebuild switch --flake /dotfiles";
      ncg = "nix-collect-garbage";
    };
    shellAliases = {
      # neofetch
      nf = "neofetch";
      # fish
      src = "source ~/.config/fish/config.fish";
      # nivm
      vdefault = "nvim /dotfiles/users/rakki/home/default.nix";
      #vfish = "";
      #nvfish= "";
      #vi3 = "";
      #nvi3 = "";
      nv = "neovide";
      v = "nvim";
      vim = "nvim";
      # file management
      ls = "ls -FahsSl --color=always";
      la = "ls -A";
      mv = "mv -i";
      rm = "rm -i";
      df = "df -h";
      du = "du -hc --time";
      tree = "tree --du -h";
      exa = "exa -lFs name --colour=always --color-scale --group-directories-first";
      rsync = "rsync -h --progress --recursive --append";
      fzf = "fzf --color=16";
      # grep
      grep = "grep --color=always";
      # youtube-dl
      ytd = "youtube-dl -o '~/Videos/%(title)s.%(ext)s' ";
      yta-best = "youtube-dl --extract-audio --audio-format best -o '~/Music/%(title)s.%(ext)s' ";
      yta-mp3 = "youtube-dl --extract-audio --audio-format mp3 -o '~/Music/%(title)s.%(ext)s' ";
      ytd-best = "youtube-dl -f mp4+bestaudio -o '~/Videos/%(title)s.%(ext)s' ";
      # misc
      pipes = "pipes.sh -t 3 -f 100 -R -r 0";
      htop = "bpytop";
      cat = "bat";
    };
    functions.fish_greeting = "${pkgs.neofetch}/bin/neofetch";
    interactiveShellInit = ''
      # Binds
      bind \e\[3\;5~ kill-word #ctrl+del
      bind \b backward-kill-word #ctrl+backspace


      set -g fish_color_cancel              -r
      set -g fish_color_command             brgreen
      set -g fish_color_comment             brmagenta
      set -g fish_color_cwd                 green
      set -g fish_color_cwd_root            red
      set -g fish_color_end                 brmagenta
      set -g fish_color_error               brred
      set -g fish_color_escape              brcyan
      set -g fish_color_history_current     --bold
      set -g fish_color_host                normal
      set -g fish_color_match               --background=brblue
      set -g fish_color_normal              normal
      set -g fish_color_operator            cyan
      set -g fish_color_param               brblue
      set -g fish_color_quote               yellow
      set -g fish_color_redirection         bryellow
      set -g fish_color_search_match        'bryellow' '--background=brblack'
      set -g fish_color_selection           'white' '--bold' '--background=brblack'
      set -g fish_color_status              red
      set -g fish_color_user                brgreen
      set -g fish_color_valid_path          --underline
      set -g fish_pager_color_completion    normal
      set -g fish_pager_color_description   yellow
      set -g fish_pager_color_prefix        'white' '--bold' '--underline'
      set -g fish_pager_color_progress      'brwhite' '--background=cyan' colors

      # Starship theme
      starship init fish | source
    '';
  };
}
