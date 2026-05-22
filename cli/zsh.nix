{ config, pkgs, ... }:
{
  # Zsh 主配置
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    history = {
      size = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
    };

    initContent = ''
      bindkey -e
      # 基本行为
      setopt AUTO_CD
      setopt AUTO_PUSHD
      setopt PUSHD_IGNORE_DUPS
      setopt SHARE_HISTORY
      setopt HIST_IGNORE_DUPS
      setopt HIST_IGNORE_SPACE
      setopt HIST_SAVE_NO_DUPS
      setopt EXTENDED_GLOB
      setopt NO_BEEP
      setopt COMPLETE_IN_WORD
      setopt ALWAYS_TO_END

      # 补全菜单
      zstyle ':completion:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'
      zstyle ':completion:*:warnings' format '%F{red}No matches%f'
      zstyle ':completion:*' group-name ""
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*:default' list-prompt '%S%M matches%s'

      # 自动建议外观
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
      ZSH_AUTOSUGGEST_STRATEGY=(history completion)

      # 别名
      alias e='exit'
      alias md='mkdir'
      alias th='touch'
      alias ls='eza --icons'                  # 使用 eza 替代 ls
      alias ll='eza -lh --icons'
      alias la='eza -A --icons'
      alias l='eza -CF --icons'
      alias tree='eza --tree --icons'
      alias ..='cd ..'
      alias ...='cd ../..'
      alias grep='grep --color=auto'
      alias ip='ip -c'
      alias df='df -h'
      alias du='du -h'
      alias lg='lazygit'

      # yazi: 退出时自动 cd 到最后浏览的目录
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-history-substring-search";
        src = pkgs.zsh-history-substring-search;
        file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
      }
    ];
  };
}
