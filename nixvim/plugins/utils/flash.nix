{
  plugins.flash = {
    enable = true;
    lazyLoad.settings.keys = [
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        __unkeyed-1 = "ss";
        __unkeyed-2 = "<cmd>lua require('flash').jump()<cr>";
        desc = "Flash";
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        __unkeyed-1 = "S";
        __unkeyed-2 = "<cmd>lua require('flash').treesitter()<cr>";
        desc = "Flash Treesitter";
      }
      {
        mode = "o";
        __unkeyed-1 = "r";
        __unkeyed-2 = "<cmd>lua require('flash').remote()<cr>";
        desc = "Remote Flash";
      }
      {
        mode = [
          "o"
          "x"
        ];
        __unkeyed-1 = "R";
        __unkeyed-2 = "<cmd>lua require('flash').treesitter_search()<cr>";
        desc = "Treesitter Search";
      }
    ];
  };
}
