{ ... }:
{
  # fish
  programs.fish = {
    enable = true;

    # config fish
    interactiveShellInit = ''
      set fish_greeting ""  # 关闭欢迎语
      fish_vi_key_bindings  # 使用 Vi 模式
      starship init fish | source  # starship
      direnv hook fish | source  # direnv
    '';

    # function
    functions = {
      y = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
    };
  };

  # bash
  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ $- == *i* ]]; then
        exec fish
      fi
    '';
  };

  # starship
  programs.starship = {
    enable = true;
  };

  home.shellAliases = {
    lg = "lazygit";
  };
}
