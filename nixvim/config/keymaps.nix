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
    #  ⚙️ 其它实用
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
          -- 1. 获取当前 Buffer 的所有活动 LSP 客户端
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          
          if #clients == 0 then
              vim.notify("No active LSP clients to restart", vim.log.levels.WARN, { title = "LSP" })
              return
          end

          -- 2. 依次关闭
          for _, client in ipairs(clients) do
              client:stop() -- 0.11 推荐的原生停止 API
          end

          -- 3. 延迟一瞬间刷新 Buffer，强制重新触发 vim.lsp.enable 加载
          vim.defer_fn(function()
              vim.cmd("edit!") -- 刷新当前文件，LSP 会随之自动起飞
              vim.notify("Native LSP Restarted!", vim.log.levels.INFO, { title = "LSP" })
          end, 150) -- 150ms 延迟，给后台进程一点喘息时间
        end
      '';
      options.desc = "Reload/Restart Native LSP";
    }
  ];
}
