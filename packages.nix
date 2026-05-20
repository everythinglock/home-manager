{ pkgs, upkgs, ... }:
{
  home.packages = with pkgs; [
    # 代码
    claude-code
    vscode

    # niri配套
    nwg-look
    vicinae # app search
    pcmanfm # file manager
    xwayland-satellite # xwayland

    grim
    satty
    slurp # 截图

    cliphist
    wl-clipboard # 剪切板

    # 办公与笔记
    libreoffice
    obsidian

    # AI
    upkgs.chatbox

    # 通讯
    qq
  ];
}
