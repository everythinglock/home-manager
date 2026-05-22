{ pkgs, ... }:
let
  python = {
    pkg = pkgs.python313Packages.pytest;
    name = "pytest";
  };
in
{
  extraPackages = [
    python.pkg
  ];
  plugins.neotest = {
    enable = true;
    adapters = {
      python = {
        enable = true;
        settings = {
          runner = python.name;
        };
      };
    };
    settings = {
      status = {
        virtual_text = true;
      };
      output = {
        open_on_run = true;
      };
    };
    lazyLoad.settings.keys = [
      {
        mode = "n";
        __unkeyed-1 = "<leader>rr";
        __unkeyed-2.__raw = ''
          function()
            require("neotest").run.run()
          end
        '';
        desc = "Run Nearest Test";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>rf";
        __unkeyed-2.__raw = ''
          function()
            require("neotest").run.run(vim.api.nvim_buf_get_name(0))
          end
        '';
        desc = "Run Current File";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>rs";
        __unkeyed-2.__raw = ''
          function()
            require("neotest").summary.toggle()
          end
        '';
        desc = "Toggle Test Summary";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>ro";
        __unkeyed-2.__raw = ''
          function()
            require("neotest").output.open({ enter = true, auto_close = true })
          end
        '';
        desc = "Show Test Output";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>rO";
        __unkeyed-2.__raw = ''
          function()
            require("neotest").output_panel.toggle()
          end
        '';
        desc = "Toggle Test Output Panel";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>rx";
        __unkeyed-2.__raw = ''
          function()
            require("neotest").run.stop()
          end
        '';
        desc = "Stop running test";
      }
    ];
  };
}
