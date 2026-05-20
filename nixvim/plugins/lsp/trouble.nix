{
  plugins.trouble = {
    enable = true;
    lazyLoad.settings.cmd = "Trouble";
  };
  keymaps = [
    {
      key = "<leader>xx";
      mode = [ "n" ];
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options.desc = "Toggle Trouble";
    }
    {
      key = "<leader>xX";
      mode = [ "n" ];
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options.desc = "Buffer Diagnostics";
    }
  ];
}
