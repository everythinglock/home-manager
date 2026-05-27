{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];
    indent.enable = true;
    highlight.enable = true;
    folding.enable = false;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };

  plugins.treesitter-context = {
    enable = true;
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];
    settings = {
      max_lines = 3; # 限制最多吸顶 3 行，防止遇到巨型嵌套时占用太多屏幕高度
      min_window_height = 0;
    };
  };
}
