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
        };
      };
      routes = [
        {
          filter = {
            event = "notify";
            find = "No information available"; # 匹配包含该文本的通知
          };
          opts.skip = true; # 直接跳过、不显示
        }
      ];
      views = {
        cmdline_popup = {
          position = {
            row = "10%";
            col = "50%";
          };
          size = {
            width = 60;
            height = "auto";
          };
          border = {
            style = "rounded";
            padding = [ 0 1 ];
          };
        };
        hover = {
          border = {
            style = "rounded"; # 强制 Hover 也是精致的圆角
          };
          position = { row = 2; col = 0; };
        };
      };
    };
    lazyLoad.settings.keys = [
      {
        __unkeyed-1 = "<S-Enter>";
        __unkeyed-2.__raw = ''function() require("noice").redirect(vim.fn.getcmdline()) end'';
        desc = "Redirect Cmdline";
      }
      {
        __unkeyed-1 = "<leader>nl";
        __unkeyed-2.__raw = ''function() require("noice").cmd("last") end'';
        desc = "Noice Last Message";
      }
      {
        __unkeyed-1 = "<leader>nh";
        __unkeyed-2.__raw = ''function() require("noice").cmd("history") end'';
        desc = "Noice History";
      }
      {
        __unkeyed-1 = "<leader>na";
        __unkeyed-2.__raw = ''function() require("noice").cmd("all") end'';
        desc = "Noice All";
      }
      {
        __unkeyed-1 = "<leader>nd";
        __unkeyed-2.__raw = ''function() require("noice").cmd("dismiss") end'';
        desc = "Dismiss All";
      }
      {
        __unkeyed-1 = "<leader>ns";
        __unkeyed-2.__raw = ''function() require("noice").cmd("pick") end'';
        desc = "Noice Picker";
      }
    ];
  };
}
