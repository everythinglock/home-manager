{
  plugins.which-key = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";

    settings = {
      preset = "modern";

      spec = [
        # normal
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffers";
          icon = "󰓩 ";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "Files";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
          icon = "󰊢 ";
        }
        {
          __unkeyed-1 = "<leader>gh";
          group = "Hunks (Git)";
          icon = "󰱅 ";
        }
        {
          __unkeyed-1 = "<leader>l";
          group = "Lsp";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "Search / Noice";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>sn";
          group = "Noice Logic";
          icon = "󱇦 ";
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "Tabs";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>x";
          group = "Diagnostic";
          icon = "󱖫 ";
        }
        {
          __unkeyed-1 = "<leader>y";
          group = "Clipboard / Yank";
          icon = "󰅍 ";
        }
        {
          __unkeyed-1 = "<leader>r";
          group = "Re";
          icon = " ";
        }
        # visual
        {
          __unkeyed-1 = "<leader>gh";
          desc = "Hunk Actions";
          mode = "v";
        }
      ];
    };
  };
}
