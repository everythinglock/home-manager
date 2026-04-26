{ pkgs, pkgsUnstable, ... }:
{
  home.packages = with pkgs; [
    #终端美化
    fastfetch # 显示信息

    #终端工具
    bat # cat 强化
    eza # ls 强化
    htop # 显示cpu内存信息
    ripgrep # grep强化
    fd # find强化
    fzf # 文件搜索
    zoxide # 地址跳转
    foot # 终端
    yazi # 终端文件管理
    pkgsUnstable.zellij # tmux

    #桌面
    xwayland-satellite
    pkgsUnstable.chatbox # ai聊天
    qq

    #语言工具
    tree-sitter
    cargo
    gcc
    nodejs
    python313
    python313Packages.pip
    pipx

    #git
    git
    lazygit
    #截图套件
    grim
    slurp
    satty
    wl-clipboard
    #剪切版
    cliphist
  ];
}
