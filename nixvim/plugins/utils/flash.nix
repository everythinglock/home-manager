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
        __unkeyed-1 = "s";
        __unkeyed-2.__raw = ''function() require('flash').jump() end'';
        desc = "Flash";
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        __unkeyed-1 = "S";
        __unkeyed-2.__raw = ''function() require('flash').treesitter() end'';
        desc = "Flash Treesitter";
      }
      {
        mode = "o";
        __unkeyed-1 = "r";
        __unkeyed-2.__raw = ''function() require('flash').remote() end'';
        desc = "Remote Flash";
      }
      {
        mode = [
          "o"
          "x"
        ];
        __unkeyed-1 = "R";
        __unkeyed-2.__raw = ''function() require('flash').treesitter_search() end'';
        desc = "Treesitter Search";
      }
    ];
  };
}
