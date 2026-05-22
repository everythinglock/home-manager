{
  plugins.trouble = {
    enable = true;
    lazyLoad.settings.keys = [
      {
        mode = [ "n" ];
        __unkeyed-1 = "<leader>xx";
        __unkeyed-2 = "<cmd>Trouble diagnostics toggle<cr>";
        desc = "Toggle Trouble";
      }
      {
        mode = [ "n" ];
        __unkeyed-1 = "<leader>xX";
        __unkeyed-2 = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
        desc = "Buffer Diagnostics";
      }
    ];
  };
}
