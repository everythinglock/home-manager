{
  plugins.oil = {
    enable = true;
    lazyLoad.settings.keys = [
      {
        __unkeyed-1 = "-";
        __unkeyed-2 = "<cmd>Oil<cr>";
        mode = "n";
        desc = "Open Oil File Manager";
      }
    ];
    settings = {
      columns = [ "icon" ];
      keymaps = {
        # --- 你已有的 ---
        "<C-c>" = false;
        "<C-l>" = false;
        "<C-r>" = "actions.refresh";
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
  autocmds = [
    {
      event = [ "FileType" ];
      pattern = [ "oil" ];
      callback.__raw = ''
        function(ev)
          -- 1. 立即禁用 inlay hints
          pcall(vim.lsp.inlay_hint.enable, false, { bufnr = ev.buf })
          
          -- 2. 立即清除可能触发 documentHighlight 的 LSP 自动命令，防止 clangd 报错
          pcall(vim.api.nvim_clear_autocmds, { event = "CursorHold", buffer = ev.buf })
          pcall(vim.api.nvim_clear_autocmds, { event = "CursorHoldI", buffer = ev.buf })
          pcall(vim.api.nvim_clear_autocmds, { event = "CursorMoved", buffer = ev.buf })
          
          -- 3. 延迟异步分离 LSP 客户端，完美避开 Neovim 内部 _changetracking 的 Lua 崩溃 Bug
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(ev.buf) then
              for _, client in ipairs(vim.lsp.get_clients({ bufnr = ev.buf })) do
                pcall(vim.lsp.buf_detach_client, ev.buf, client.id)
              end
            end
          end)
        end
      '';
      desc = "安全地禁用 oil 缓冲区的 LSP 功能，防止 clangd 报错及 Lua 崩溃";
    }
  ];
}
