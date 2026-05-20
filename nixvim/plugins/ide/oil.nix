{
  plugins.oil = {
    enable = true;
    lazyLoad.settings.cmd = "Oil";
    settings = {
      columns = [ "icon" ];
      keymaps = {
        # --- 你已有的 ---
        "<C-c>" = false;
        "<C-l>" = false;
        "<C-r>" = "actions.refresh";
        "<leader>q" = "actions.close";
        "q" = "actions.close";
        "y." = "actions.copy_entry_path";
        "-" = "actions.parent";
        "`" = "actions.cd";
        "g." = "actions.toggle_hidden";
        "gx" = "actions.open_external";
      };
    };
    skip_confirm_for_simple_edits = true;
    view_options.show_hidden = false;
    win_options = {
      concealcursor = "ncv";
      conceallevel = 3;
      cursorcolumn = false;
      foldcolumn = "0";
      list = false;
      signcolumn = "no";
      spell = false;
      wrap = false;
    };
  };
  keymaps = [
    {
      key = "-";
      mode = "n";
      action = "<cmd>Oil<cr>";
      options.desc = "Open Oil File Manager";
    }
  ];
}
