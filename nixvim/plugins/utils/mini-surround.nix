{
  plugins.mini-surround = {
    enable = true;
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];
    settings = {
      mappings = {
        add = "gsa"; # 增加环绕
        delete = "gsd"; # 删除环绕
        find = "gsf"; # 向右寻找环绕
        find_left = "gsF"; # 向左寻找环绕
        highlight = "gsh"; # 高亮环绕
        replace = "gsr"; # 替换环绕
        update_n_lines = "gsn"; # 调整扫描行数
      };
    };
  };
}
