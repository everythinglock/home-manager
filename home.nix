{ config, pkgs, ... }:
let
  username = "fd";
  dotDir = "dotfiles";
  homeDir = "homefiles";
in {
  nixpkgs.config.allowUnfree = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
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
    starship # shell信息增强
    foot # 终端
    yazi # 终端文件管理
    zellij # tmux

    # 桌面
    nwg-look # gtk主题配置

    # 语言工具
    cargo
    gcc
    nodejs
    python313
    python313Packages.pip
    pipx
    tree-sitter

    # 开发工具
    neovim
    git
    lazygit

    # 系统工具
    grim slurp satty # 截图三件套
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".bashrc".source = ./${homeDir}/.bashrc;
    # ".screenrc".source = dotfiles/screenrc;

    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  xdg.configFile = {
    "fish".source = ./${dotDir}/fish;
    "nvim".source = ./${dotDir}/nvim;
    # 2. niri 部分：拆开手工链接，不管 noctalia.kdl
    "niri/config.kdl".source = ./${dotDir}/niri/config.kdl;
    "niri/environment.kdl".source = ./${dotDir}/niri/environment.kdl;
    "niri/keybind.kdl".source = ./${dotDir}/niri/keybind.kdl;
    "niri/input.kdl".source = ./${dotDir}/niri/input.kdl;
    "niri/layerRule.kdl".source = ./${dotDir}/niri/layerRule.kdl;
    "niri/windowRule.kdl".source = ./${dotDir}/niri/windowRule.kdl;
    "niri/startup.kdl".source = ./${dotDir}/niri/startup.kdl;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "$HOME/.nix-profile/bin"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

}
