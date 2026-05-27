{
  plugins.snacks = {
    enable = true;

    settings = {
      bigfile = {
        enabled = true;
        size = 1024 * 1024; # 1MB
      };
      dashboard = {
        enabled = true;
        sections = [
          { section = "header"; }
          {
            section = "keys";
            gap = 1;
            padding = 1;
          }
        ];
        preset = {
          keys = [
            {
              icon = " ";
              key = "n";
              desc = "New file";
              action = ":ene | startinsert";
            }
            {
              icon = " ";
              key = "f";
              desc = "Find file";
              action.__raw = "function() Snacks.picker.files() end";
            }
            {
              icon = " ";
              key = "t";
              desc = "Find text";
              action.__raw = "function() Snacks.picker.grep() end";
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent files";
              action.__raw = "function() Snacks.picker.recent() end";
            }
            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa";
            }
          ];
        };
      };
      explorer.enabled = true;
      indent.enabled = true;
      input.enabled = true;
      lazygit.enabled = true;
      notifier.enabled = true;
      picker.enabled = true;
      quickfile.enabled = true;
      scroll.enabled = true;
      statuscolumn.enabled = true;
      terminal.enabled = true;
      words.enabled = true;
      zen.enabled = true;
    };
  };

  # ---------- Snacks 全局快捷键 ----------
  keymaps = [
    {
      key = "<leader><space>";
      mode = "n";
      action.__raw = "function() Snacks.picker.smart() end";
      options.desc = "Smart Find Files";
    }
    {
      key = "<leader>cR";
      mode = "n";
      action.__raw = "function() Snacks.rename.rename_file() end";
      options.desc = "LSP-Aware Rename Current File";
    }
    {
      key = "<leader>e";
      mode = "n";
      action.__raw = "function() Snacks.explorer() end";
      options.desc = "File explorer";
    }
    {
      key = "<leader>ff";
      mode = "n";
      action.__raw = "function() Snacks.picker.files() end";
      options.desc = "Find files";
    }
    {
      key = "<leader>fr";
      mode = "n";
      action.__raw = "function() Snacks.picker.recent() end";
      options.desc = "Find recent files";
    }
    {
      key = "<leader>fb";
      mode = "n";
      action.__raw = "function() Snacks.picker.buffers() end";
      options.desc = "Find buffers";
    }
    {
      key = "<leader>fh";
      mode = "n";
      action.__raw = "function() Snacks.picker.help() end";
      options.desc = "Find help";
    }
    {
      key = "<leader>fc";
      mode = "n";
      action.__raw = "function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end";
      options.desc = "Find Neovim Config File";
    }
    {
      key = "<leader>fg";
      mode = "n";
      action.__raw = "function() Snacks.picker.git_files() end";
      options.desc = "Find Tracked Git Files Only";
    }
    {
      key = "<leader>gg";
      mode = "n";
      action.__raw = "function() Snacks.lazygit() end";
      options.desc = "Lazygit";
    }
    {
      key = "<leader>gB";
      mode = [
        "n"
        "v"
      ];
      action.__raw = "function() Snacks.gitbrowse() end";
      options.desc = "Open Git repo in Browser";
    }
    {
      key = "<leader>th";
      mode = "n";
      action.__raw = "function() Snacks.toggle.inlay_hints():toggle() end";
      options.desc = "Toggle LSP Inlay Hints";
    }
    {
      key = "<leader>td";
      mode = "n";
      action.__raw = "function() Snacks.toggle.diagnostics():toggle() end";
      options.desc = "Toggle Code Diagnostics";
    }
    {
      key = "<leader>/";
      mode = "n";
      action.__raw = "function() Snacks.picker.lines() end";
      options.desc = "Search buffer lines";
    }
    {
      key = "<leader>st";
      mode = "n";
      action.__raw = "function() Snacks.picker.grep() end";
      options.desc = "Find text";
    }
    {
      key = "<leader>sk";
      mode = "n";
      action.__raw = "function() Snacks.picker.keymaps() end";
      options.desc = "Find keymaps";
    }
    {
      key = "<leader>sgd";
      mode = "n";
      action.__raw = "function() Snacks.picker.git_diff() end";
      options.desc = "Git diff (Picker)";
    }
    {
      key = "<leader>sgs";
      mode = "n";
      action.__raw = "function() Snacks.picker.git_status() end";
      options.desc = "Git Status (Picker)";
    }
    {
      key = "<leader>sgl";
      mode = "n";
      action.__raw = "function() Snacks.picker.git_log() end";
      options.desc = "Git Commits Log (Interactive)";
    }
    {
      key = "<leader>sgb";
      mode = "n";
      action.__raw = "function() Snacks.picker.git_branches() end";
      options.desc = "Git Branches (Picker)";
    }
    {
      key = "<leader>sy";
      mode = "n";
      action.__raw = "function() Snacks.picker.registers() end";
      options.desc = "Search yank";
    }
    {
      key = "<leader>ss";
      mode = "n";
      action.__raw = "function() Snacks.picker.lsp_symbols() end";
      options.desc = "LSP Document Symbols";
    }
    {
      key = "<leader>sS";
      mode = "n";
      action.__raw = "function() Snacks.picker.lsp_workspace_symbols() end";
      options.desc = "LSP Workspace Symbols";
    }
    {
      key = "<leader>sR";
      mode = "n";
      action.__raw = "function() Snacks.picker.resume() end";
      options.desc = "Resume Last Search";
    }
    {
      key = "<leader>su";
      mode = "n";
      action.__raw = "function() Snacks.picker.undo() end";
      options.desc = "Search Undo Tree (Visual)";
    }
    {
      key = "<leader>tw";
      mode = "n";
      action.__raw = "function() Snacks.toggle.option('wrap', { name = 'Line Wrap' }):toggle() end";
      options.desc = "Toggle Line Wrap";
    }
    {
      key = "<leader>tT";
      mode = "n";
      action.__raw = "function() Snacks.toggle.treesitter():toggle() end";
      options.desc = "Toggle Treesitter Syntax";
    }
    {
      key = "<leader>tz";
      mode = "n";
      action.__raw = "function() Snacks.zen() end";
      options.desc = "Toggle zen";
    }
    {
      key = "<leader>tt";
      mode = "n";
      action.__raw = "function() Snacks.terminal() end";
      options.desc = "Toggle terminal";
    }
    {
      key = "<leader>tf";
      mode = "n";
      action.__raw = ''
        function()
          local shell = vim.o.shell or vim.env.SHELL or "bash"
          Snacks.terminal(shell, { float = true })
        end
      '';
      options.desc = "Toggle Floating terminal";
    }
    {
      key = "]]";
      mode = [
        "n"
        "t"
      ];
      action.__raw = "function() Snacks.words.jump(vim.v.count1) end";
      options.desc = "Next Reference Word";
    }
    {
      key = "[[";
      mode = [
        "n"
        "t"
      ];
      action.__raw = "function() Snacks.words.jump(-vim.v.count1) end";
      options.desc = "Prev Reference Word";
    }
    {
      key = "gd";
      mode = "n";
      action.__raw = "function() Snacks.picker.lsp_definitions() end";
      options.desc = "LSP Go to Definition";
    }
    {
      key = "gD";
      mode = "n";
      action.__raw = "function() Snacks.picker.lsp_declarations() end";
      options.desc = "LSP Go to Declaration";
    }
    {
      key = "gr";
      mode = "n";
      action.__raw = "function() Snacks.picker.lsp_references() end";
      options.desc = "LSP Find References";
    }
    {
      key = "gI";
      mode = "n";
      action.__raw = "function() Snacks.picker.lsp_implementations() end";
      options.desc = "LSP Go to Implementation";
    }
    {
      key = "gt";
      mode = "n";
      action.__raw = "function() Snacks.picker.lsp_type_definitions() end";
      options.desc = "LSP Go to Type Definition";
    }
    {
      key = "<C-'>";
      mode = [
        "n"
        "t"
      ];
      action.__raw = ''
        function()
          local terminals = Snacks.terminal.list()
          -- 先找浮动终端
          for _, term in ipairs(terminals) do
            if term.opts.float then
              term:toggle()
              return
            end
          end
          -- 再找普通终端
          for _, term in ipairs(terminals) do
            if not term.opts.float then
              term:toggle()
              return
            end
          end
          -- 都没有则打开浮动终端
          local shell = vim.o.shell or vim.env.SHELL or "bash"
          Snacks.terminal(shell, { float = true })
        end
      '';
      options.desc = "Toggle terminal (float > normal)";
    }
    {
      key = "<leader>bd";
      mode = "n";
      action.__raw = "function() Snacks.bufdelete() end";
      options.desc = "Buffer delete";
    }
  ];
}
