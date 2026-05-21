{ upkgs, ... }:
{
  programs.nixvim = {
    _module.args.upkgs = upkgs; # 关键：注入到 nixvim 的内部模块参数中
    enable = true;
    imports = [
      ./config
      ./plugins
    ];

    viAlias = true;
    vimAlias = true;
  };
}
