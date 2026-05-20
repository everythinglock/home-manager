{
  plugins.flash = {
    enable = true;
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
  keymaps = [
    {
      key = "ss";
      mode = [
        "n"
        "x"
        "o"
      ];
      action = "<cmd>lua require('flash').jump()<cr>";
      options.desc = "Flash";
    }
    {
      key = "S";
      mode = [
        "n"
        "x"
        "o"
      ];
      action = "<cmd>lua require('flash').treesitter()<cr>";
      options.desc = "Flash Treesitter";
    }
    {
      key = "r";
      mode = "o";
      action = "<cmd>lua require('flash').remote()<cr>";
      options.desc = "Remote Flash";
    }
    {
      key = "R";
      mode = [
        "o"
        "x"
      ];
      action = "<cmd>lua require('flash').treesitter_search()<cr>";
      options.desc = "Treesitter Search";
    }
  ];
}
