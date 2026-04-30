{ pkgs, pkgsUnstable, ... }:
{
  home.packages = with pkgs; [
    #终端工具
    fastfetch # 显示信息
    bat # cat 强化
    eza # ls 强化
    htop # 显示cpu内存信息
    ripgrep # grep强化
    fd # find强化
    fzf # 文件搜索
    yazi # 终端文件管理
    pkgsUnstable.zellij # tmux

    #桌面
    vicinae # search app
    xwayland-satellite
    pkgsUnstable.chatbox # ai聊天
    qq
    obsidian # 笔记

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
    #剪切版
    wl-clipboard
    cliphist
  ];
}
