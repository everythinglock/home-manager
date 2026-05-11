{ pkgs, pkgsUnstable, ... }:
{
  home.packages = with pkgs; [
    # 终端工具
    bat
    eza
    fastfetch
    fd
    fzf
    htop
    pkgsUnstable.zellij
    ripgrep
    yazi

    # 代码工具
    claude-code
    tree-sitter
    vscode

    # GUI 应用
    nwg-look
    pkgsUnstable.chatbox
    qq
    quickshell
    vicinae
    xfce.thunar
    xwayland-satellite

    # 办公与笔记
    libreoffice
    obsidian

    # 语言工具
    cargo
    gcc
    nodejs
    pipx
    python313
    python313Packages.pip

    # Git 相关
    git
    lazygit

    # 截图套件
    grim
    satty
    slurp

    # 剪切板
    cliphist
    wl-clipboard
  ];
}
