{
  plugins.which-key = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";

    settings = {
      preset = "modern";

      spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffers";
          icon = "󰓩 ";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "Change";
          icon = " ";
          mode = [ "v" "n" ];
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "Find";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Git hunks";
          icon = "󰊢 ";
          mode = [ "v" "n" ];
        }
        {
          __unkeyed-1 = "<leader>n";
          group = "Notify";
          icon = "󰎟 ";
        }
        {
          __unkeyed-1 = "<leader>r";
          group = "Reload";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "Search";
          icon = "󰨼 ";
        }
        {
          __unkeyed-1 = "<leader>sg";
          group = "Git";
          icon = "󰊢 ";
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "Toggle";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>x";
          group = "Diagnostic";
          icon = "󱖫 ";
        }
        {
          __unkeyed-1 = "<leader>y";
          group = "Yank";
          icon = "󰅍 ";
          mode = [ "v" "n" ];
        }
      ];
    };
  };
}
