{
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    imports = [
      ./config
      ./plugins
    ];
  };
}
