{ pkgs, ... }: {
  home.packages = with pkgs; [
    # 终端美化
    fastfetch # 显示信息

    # 终端工具
    bat #cat 强化
    eza # ls 强化
    htop # 显示cpu内存信息
    ripgrep # grep强化
    fd # find强化
    fzf # 文件搜索
    zoxide # 地址跳转
    foot # 终端
    yazi # 终端文件管理
    zellij # tmux

    # 桌面软件
    nwg-look # gtk主题配置
    chatbox # ai聊天

    # 语言工具
    tree-sitter
    cargo
    gcc
    nodejs
    python313 python313Packages.pip pipx

    # 开发工具
    neovim
    git
    lazygit

    # 系统工具
    grim slurp satty # 截图三件套
  ];
}
