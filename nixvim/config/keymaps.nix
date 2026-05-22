{
  globals.mapleader = " ";
  keymaps = [
    # ═══════════════════════════════════════
    #  📁 Save/Quit
    # ═══════════════════════════════════════
    {
      mode = "n";
      key = "<leader>bs";
      action = "<cmd>w<CR>";
      options.desc = "Save current buffer";
    }
    {
      mode = "n";
      key = "<leader>bS";
      action = "<cmd>wa<CR>";
      options.desc = "Save all buffers";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>q<CR>";
      options = {
        desc = "Quit window";
      };
    }
    # ═══════════════════════════════════════
    #  ✏️ Move
    # ═══════════════════════════════════════
    {
      mode = "i";
      key = "<C-h>";
      action = "<Left>";
      options.desc = "Move left";
    }
    {
      mode = "i";
      key = "<C-l>";
      action = "<Right>";
      options.desc = "Move right";
    }
    {
      mode = "i";
      key = "<C-j>";
      action = "<Down>";
      options.desc = "Move down";
    }
    {
      mode = "i";
      key = "<C-k>";
      action = "<Up>";
      options.desc = "Move up";
    }
    {
      mode = "i";
      key = "<C-e>";
      action = "<End>";
      options.desc = "Jump to EOL";
    }
    {
      mode = "i";
      key = "<C-a>";
      action = "<Home>";
      options.desc = "Jump to SOL";
    }
    # ═══════════════════════════════════════
    #  📋 Buffer
    # ═══════════════════════════════════════
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<CR>";
      options = {
        desc = "Next buffer";
      };
    }
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<CR>";
      options = {
        desc = "Previous buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>%bd|e#<CR>";
      options = {
        desc = "Close other buffers";
      };
    }
    # ═══════════════════════════════════════
    #  📋 Window
    # ═══════════════════════════════════════
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        desc = "Focus left window";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        desc = "Focus down window";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        desc = "Focus up window";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        desc = "Focus right window";
      };
    }
    # ═══════════════════════════════════════
    #  ✏️ Edit Pro
    # ═══════════════════════════════════════
    # 上下移动当前行（保持缩进）
    {
      mode = "v";
      key = "<A-j>";
      action = ":m '>+1<CR>gv=gv";
      options = {
        desc = "Move selection down";
      };
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":m '<-2<CR>gv=gv";
      options = {
        desc = "Move selection up";
      };
    }
    # 正常模式下整行移动
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>m .+1<CR>==";
      options = {
        desc = "Move line down";
      };
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>m .-2<CR>==";
      options = {
        desc = "Move line up";
      };
    }
    # 保持居中搜索跳转
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {
        desc = "Next search + center";
      };
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = {
        desc = "Previous search + center";
      };
    }
    # 缩进保持选中（可视化）
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        desc = "Indent left and reselect";
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        desc = "Indent right and reselect";
      };
    }
    # ═══════════════════════════════════════
    #  ✏️ Yank
    # ═══════════════════════════════════════
    # 复制到系统剪贴板 (yank)
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>yy";
      action = ''"+y'';
      options.desc = "Yank to system clipboard";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>yY";
      action = ''"+yg_'';
      options.desc = "Yank line to system clipboard";
    }
    # 剪切到系统剪贴板 (delete/cut)
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>yd";
      action = ''"+d'';
      options.desc = "Cut to system clipboard";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>yx";
      action = ''"+x'';
      options.desc = "Cut character/selection to system";
    }
    # 从系统剪贴板粘贴 (paste)
    {
      mode = "n";
      key = "<leader>yp";
      action = ''"+p'';
      options.desc = "Paste after cursor (system)";
    }
    {
      mode = "v";
      key = "<leader>yp";
      action = ''"+P'';
      options.desc = "Paste";
    }
    {
      mode = "n";
      key = "<leader>yP";
      action = ''"+P'';
      options.desc = "Paste before cursor (system)";
    }
    # ═══════════════════════════════════════
    #  ✏️ Time Undo
    # ═══════════════════════════════════════
    {
      mode = "n";
      key = "g-";
      action = "g-";
      options.desc = "Undo tree: older";
    }
    {
      mode = "n";
      key = "g+";
      action = "g+";
      options.desc = "Undo tree: newer";
    }
    # ═══════════════════════════════════════
    #  ⚙️ Reload
    # ═══════════════════════════════════════
    {
      mode = "n";
      key = "<leader>re";
      action = "<cmd>e!<CR>";
      options = {
        desc = "Reload current file";
      };
    }
    {
      action.__raw = ''
        function()
          local current_file = vim.api.nvim_buf_get_name(0)
          -- 防御性编程：如果是无名 buffer 或者是特殊 buffer（如 Terminal 或 Dashboard），直接返回
          if current_file == "" or vim.bo.buftype ~= "" then
            vim.notify("Cannot change directory: Not a valid file buffer", vim.log.levels.WARN, { title = "System" })
            return
          end
          local current_dir = vim.fn.fnamemodify(current_file, ":p:h")
          vim.api.nvim_set_current_dir(current_dir)
          vim.notify("PWD changed to:\n" .. current_dir, vim.log.levels.INFO, { title = "System" })
        end
      '';
      key = "<leader>r~";
      mode = "n";
      options.desc = "Reload CWD";
    }
    # ═══════════════════════════════════════
    #  ⚙️ 其它实用
    # ═══════════════════════════════════════
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
      options.desc = "Clear Search Highlights";
    }
    {
      mode = "n";
      key = "<leader>rl";
      action.__raw = ''
        function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if #clients == 0 then
              vim.notify("No active LSP clients to restart", vim.log.levels.WARN, { title = "LSP" })
              return
          end
          for _, client in ipairs(clients) do
              client:stop()
          end
          vim.defer_fn(function()
              vim.cmd("edit!")
              vim.notify("Native LSP Restarted!", vim.log.levels.INFO, { title = "LSP" })
          end, 150)
        end
      '';
      options.desc = "Reload/Restart Native LSP";
    }
  ];
}
