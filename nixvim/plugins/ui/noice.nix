{
  plugins.noice = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings = {
      lsp = {
        hover.enabled = true;
        signature.enabled = true;
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
      };
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = false;
        lsp_doc_border = true;
      };
    };
  };
  keymaps = [
    {
      key = "<S-Enter>";
      mode = [ "c" ];
      action.__raw = ''function() require("noice").redirect(vim.fn.getcmdline()) end'';
      options.desc = "Redirect Cmdline";
    }
    {
      key = "<leader>nl";
      mode = [ "n" ];
      action.__raw = ''function() require("noice").cmd("last") end'';
      options.desc = "Noice Last Message";
    }
    {
      key = "<leader>nh";
      mode = [ "n" ];
      action.__raw = ''function() require("noice").cmd("history") end'';
      options.desc = "Noice History";
    }
    {
      key = "<leader>na";
      mode = [ "n" ];
      action.__raw = ''function() require("noice").cmd("all") end'';
      options.desc = "Noice All";
    }
    {
      key = "<leader>nd";
      mode = [ "n" ];
      action.__raw = ''function() require("noice").cmd("dismiss") end'';
      options.desc = "Dismiss All";
    }
    {
      key = "<leader>ns";
      mode = [ "n" ];
      action.__raw = ''function() require("noice").cmd("pick") end'';
      options.desc = "Noice Picker (Telescope/FzfLua)";
    }
  ];
}
