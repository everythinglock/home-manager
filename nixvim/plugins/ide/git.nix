{
  plugins.gitsigns = {
    enable = true;

    # 1. 延迟加载配置
    lazyLoad.settings = {
      event = [
        "BufReadPost"
        "BufNewFile"
      ];
    };

    settings = {
      current_line_blame = true;
      current_line_blame_opts = {
        delay = 500;
        virt_text = true;
        virt_text_pos = "eol";
      };

      on_attach = ''
        function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- --- 导航 (Navigation) ---
          map('n', ']h', function()
            if vim.wo.diff then return ']h' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true, desc = "Next Git Hunk"})

          map('n', '[h', function()
            if vim.wo.diff then return '[h' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true, desc = "Prev Git Hunk"})

          -- 块级操作 (Stage/Reset hunk)
          map('n', '<leader>gs', gs.stage_hunk, { desc = "Stage Hunk" })
          map('n', '<leader>gr', gs.reset_hunk, { desc = "Reset Hunk" })
          
          -- 可视模式操作 (Stage/Reset selection)
          map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage Selection" })
          map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset Selection" })
          
          -- 全局/预览/审查操作
          map('n', '<leader>gS', gs.stage_buffer, { desc = "Stage Buffer" })
          map('n', '<leader>gu', gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
          map('n', '<leader>gR', gs.reset_buffer, { desc = "Reset Buffer" })
          map('n', '<leader>gp', gs.preview_hunk, { desc = "Preview Hunk" })
          map('n', '<leader>gb', function() gs.blame_line{full=true} end, { desc = "Blame Line" })
          map(
            'n', 
            '<leader>gd',
            function()
              local current_win = vim.api.nvim_get_current_win()
              local current_tab = vim.api.nvim_get_current_tabpage()
              local wins = vim.api.nvim_tabpage_list_wins(current_tab)
              local diff_win = nil
              for _, win in ipairs(wins) do
                if vim.wo[win].diff and win ~= current_win then
                  diff_win = win
                  break
                end
              end
              if diff_win then
                vim.api.nvim_win_close(diff_win, true)
                vim.cmd("diffoff")
              else
                -- 全局安全触发：这里用 pcall 防止在无名/不支持 git 的 buffer 下报错
                local ok, gs = pcall(require, "gitsigns")
                if ok then
                  gs.diffthis()
                else
                  vim.notify("Git compiler not ready here", vim.log.levels.WARN)
                end
              end
            end,
            { desc = "Diff This" })
          map('n', '<leader>gD', function() gs.diffthis('~') end, { desc = "Diff This (~)" })

          -- --- 文本对象 (Text Objects) ---
          -- 支持 cih (change inner hunk), dah (delete a hunk) 等操作
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Git Hunk" })
        end
      '';
    };
  };
}
