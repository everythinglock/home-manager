{
  # zoxide 智能目录跳转
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ]; # 直接用 cd 触发 zoxide，替换原生 cd
  };
}
