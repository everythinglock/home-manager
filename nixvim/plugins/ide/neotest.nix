{ pkgs, ... }:
let
  pythonWithTest = pkgs.python313.withPackages (ps: [
    ps.pytest
  ]);
in
{
  extraPackages = [
    pythonWithTest
  ];

  plugins.neotest = {
    enable = true;
    adapters = {
      python.enable = true;
      ctest.enable = true;
    };
    settings = {
      status = {
        virtual_text = true;
      };
      output = {
        open_on_run = false; 
      };
    };
    lazyLoad.settings.keys = [
      {
        mode = "n";
        __unkeyed-1 = "<leader>ur";
        __unkeyed-2.__raw = ''
          function()
            require("neotest").run.run()
          end
        '';
        desc = "Run Nearest Test";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>uf";
        __unkeyed-2.__raw = ''
          function()
            require("neotest").run.run(vim.api.nvim_buf_get_name(0))
          end
        '';
        desc = "Run Current File";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>us";
        __unkeyed-2.__raw = ''
          function()
            require("neotest").summary.toggle()
          end
        '';
        desc = "Toggle Test Summary";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>uo";
        __unkeyed-2.__raw = ''
          function()
            require("neotest").output.open({ enter = true, auto_close = true })
          end
        '';
        desc = "Show Test Output";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>uO";
        __unkeyed-2.__raw = ''
          function()
            require("neotest").output_panel.toggle()
          end
        '';
        desc = "Toggle Test Output Panel";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>ux";
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
