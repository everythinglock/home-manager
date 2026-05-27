{ config, pkgs, ... }:
{
  # 确保 fzf 的 Bash 集成已启用，提供极速的 Ctrl+R 历史搜索
  programs.fzf.enableBashIntegration = true;

  # Bash 主配置
  programs.bash = {
    enable = true;
    enableCompletion = true;

    historySize = 10000;
    historyFileSize = 10000;
    historyFile = "${config.home.homeDirectory}/.bash_history";

    # 别名配置（与 Zsh 保持完全一致）
    shellAliases = {
      e = "exit";
      md = "mkdir";
      th = "touch";
      ls = "eza --icons";                  # 使用 eza 替代 ls
      ll = "eza -lh --icons";
      la = "eza -A --icons";
      l = "eza -CF --icons";
      tree = "eza --tree --icons";
      ".." = "cd ..";
      "..." = "cd ../..";
      grep = "grep --color=auto";
      ip = "ip -c";
      df = "df -h";
      du = "du -h";
      lg = "lazygit";

      # aider
      ai = "env LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 aider";
      aib = "env LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 aider --architect --model openai/gemini-3.1-pro-preview --editor-model openai/gemini-3.5-flash";
      aih = "env LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 aider --restore-chat-history";
      aibh = "env LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 aider --architect --model gemini/gemini-3.1-pro-preview --editor-model openai/gemini-3.5-flash --restore-chat-history";
    };

    initExtra = ''
      # 基本行为
      shopt -s autocd 2>/dev/null             # 输入目录名直接 cd (等同于 AUTO_CD)
      shopt -s cdspell 2>/dev/null            # 自动纠正 cd 拼写错误
      shopt -s checkwinsize                   # 窗口大小改变时更新 LINES 和 COLUMNS
      shopt -s histappend                     # 追加历史而不是覆盖

      # FZF 智能 Tab 键补全
      # 当你输入路径或命令并按下 Tab 时，自动弹出 FZF 悬浮窗进行模糊搜索
      _fzf_tab_completion() {
        # 获取当前光标前的输入
        local token="''${READLINE_LINE:0:$READLINE_POINT}"
        # 提取最后一个单词
        local last_word="''${token##* }"
        
        # 如果是空输入，执行默认的 Tab 行为
        if [[ -z "$last_word" ]]; then
          return
        fi

        # 使用 fzf 搜索当前目录下的文件/文件夹
        local selected
        selected=$(find . -maxdepth 3 2>/dev/null | fzf --height 40% --layout=reverse --border --info=inline \
          --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
          --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
          --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
          -q "$last_word")

        if [[ -n "$selected" ]]; then
          # 去除路径前缀 ./
          selected="''${selected#./}"
          # 替换最后一个单词为选择的内容
          READLINE_LINE="''${READLINE_LINE:0:$((READLINE_POINT - ''${#last_word}))}''${selected}''${READLINE_LINE:$READLINE_POINT}"
          # 移动光标到插入内容之后
          READLINE_POINT=$((READLINE_POINT - ''${#last_word} + ''${#selected}))
        fi
      }
      # 将 Tab 键绑定到我们的 FZF 智能补全函数
      # 如果需要原生补全，可以按两次 Tab，或者使用 Shift+Tab
      if [[ $- == *i* ]]; then
        define_fzf_tab() {
          bind -x '"\t": _fzf_tab_completion'
          bind '"\e[Z": menu-complete' # 将 Shift+Tab 留作备用原生补全
        }
        define_fzf_tab
      fi

      # 实时共享历史记录 (等同于 Zsh 的 SHARE_HISTORY)
      # 使用 history -n 代替 history -r，只读取新增的历史记录，避免每次都重新加载万行历史导致卡顿
      _share_history() {
        history -a
        history -n
      }
      if [[ -z "$PROMPT_COMMAND" ]]; then
        PROMPT_COMMAND="_share_history"
      elif [[ "$PROMPT_COMMAND" != *"_share_history"* ]]; then
        # 移除末尾可能存在的分号，避免拼接出 ;;
        PROMPT_COMMAND="_share_history; ''${PROMPT_COMMAND%;}"
        # 确保替换掉任何意外产生的双分号
        PROMPT_COMMAND="''${PROMPT_COMMAND//;;/;}"
      fi

      # 历史记录子串搜索 (绑定方向键上/下，等同于 zsh-history-substring-search)
      bind '"\e[A": history-search-backward'
      bind '"\e[B": history-search-forward'

      # yazi: 退出时自动 cd 到最后浏览的目录
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }

      # aider 环境变量
      export OPENAI_API_BASE="http://127.0.0.1:8889/v1"
      export OPENAI_API_KEY="sk-dummy-key"
    '';
  };
}
