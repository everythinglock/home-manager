{
  plugins.snacks = {
    enable = true;

    settings = {
      bigfile.enabled = true;
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
              key = "g";
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
      key = "<leader>ff";
      mode = "n";
      action.__raw = "function() Snacks.picker.files() end";
      options.desc = "Find files (Snacks)";
    }
    {
      key = "<leader>fg";
      mode = "n";
      action.__raw = "function() Snacks.picker.grep() end";
      options.desc = "Find text (Snacks)";
    }
    {
      key = "<leader>fr";
      mode = "n";
      action.__raw = "function() Snacks.picker.recent() end";
      options.desc = "Recent files (Snacks)";
    }
    {
      key = "<leader>fb";
      mode = "n";
      action.__raw = "function() Snacks.picker.buffers() end";
      options.desc = "Find buffers (Snacks)";
    }
    {
      key = "<leader>fh";
      mode = "n";
      action.__raw = "function() Snacks.picker.help() end";
      options.desc = "Help tags (Snacks)";
    }
    {
      key = "<leader>fk";
      mode = "n";
      action.__raw = "function() Snacks.picker.keymaps() end";
      options.desc = "Keymaps (Snacks)";
    }
    {
      key = "<leader>fe";
      mode = "n";
      action.__raw = "function() Snacks.explorer() end";
      options.desc = "File explorer (Snacks)";
    }
    {
      key = "<leader>fz";
      mode = "n";
      action.__raw = "function() Snacks.zen() end";
      options.desc = "Toggle zen mode (Snacks)";
    }
    {
      key = "<leader>tt";
      mode = "n";
      action.__raw = "function() Snacks.terminal() end";
      options.desc = "Toggle terminal (Snacks)";
    }
    {
      key = "<leader>tl";
      mode = "n";
      action.__raw = "function() Snacks.lazygit() end";
      options.desc = "Lazygit (Snacks)";
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
      options.desc = "Floating terminal (Snacks)";
    }
    {
      key = "<C-\\>";
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
  ];
}
