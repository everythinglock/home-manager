{
  plugins.grug-far = {
    enable = true;
    lazyLoad.settings.keys = [
      {
        mode = "n";
        __unkeyed-1 = "<leader>sr";
        __unkeyed-2.__raw = "function() require('grug-far').open({ transient = true }) end";
        desc = "Search and replace";
      }
      {
        mode = "v";
        __unkeyed-1 = "<leader>sr";
        __unkeyed-2.__raw = ''
          function()
              require("grug-far").with_visual_selection({
                  prefills = {
                      paths = vim.fn.expand("%"), 
                  }
              })
          end'';
        desc = "Search and replace selection (Current File)";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>cw";
        __unkeyed-2.__raw = ''function() require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } }) end'';
        desc = "Search and replace";
      }
    ];
  };
}
