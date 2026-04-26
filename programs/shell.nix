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
      zoxide init fish | source # zoxide
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
    # 文件与目录（用 eza 替代 ls）
    ls = "eza --icons"; # 带图标
    ll = "eza -alh --icons"; # 详细列表，人类可读
    la = "eza -a --icons"; # 显示隐藏文件
    l = "eza -l --icons"; # 长格式
    tree = "eza --tree --icons";

    # 导航（zoxide 替代 cd）
    cd = "z"; # zoxide 跳转
    ".." = "z ..";
    "..." = "z ../..";
    "...." = "z ../../..";

    # 查看文件（bat 替代 cat）
    cat = "bat --paging=never";

    # 进程管理
    ps = "ps aux";
    top = "htop";

    # Git
    g = "git";
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gcm = "git commit -m";
    gp = "git push";
    gl = "git log --oneline --graph --decorate";
    gd = "git diff";
    gco = "git checkout";
    gb = "git branch";
    lg = "lazygit";

    # 系统管理
    sys = "systemctl";
    sysu = "systemctl --user";
    j = "journalctl";
    ju = "journalctl --user";

    # 压缩解压
    untar = "tar -xvf";
    targz = "tar -czvf";

    # 网络
    ip = "ip --color=auto";
    ping = "ping -c 5";
    myip = "curl -s ifconfig.me";

    # 开发工具
    v = "nvim";
    c = "clear";
  };
}
