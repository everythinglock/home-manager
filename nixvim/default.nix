{
  programs.nixvim = {
    enable = true;
    imports = [
      ./config
      ./plugins
    ];

    viAlias = true;
    vimAlias = true;
  };
}
