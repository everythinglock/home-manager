{
  autoCmd = [
    {
      event = [ "InsertLeave" ];
      pattern = "*";
      command = ''lua vim.opt.cursorline=true'';
      desc = "离开插入模式时高亮行";
    }
    {
      event = [ "InsertEnter" ];
      pattern = "*";
      command = ''lua vim.opt.cursorline=false'';
      desc = "进入插入模式时取消高亮行";
    }
    {
      event = [ "BufReadPost" ];
      pattern = "*";
      command = ''if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif'';
      desc = "回到上次编辑文件的位置";
    }
    {
      event = [ "TermOpen" ];
      pattern = "*";
      command = "startinsert";
      desc = "在终端模式时自动进入插入模式";
    }
    {
      event = [ "TermLeave" ];
      pattern = "*";
      command = "stopinsert";
      desc = "退出终端时回到普通模式";
    }
    {
      event = [ "FileType" ];
      pattern = [ "nix" ];
      callback.__raw = ''
        function()
          vim.opt_local.tabstop = 2
          vim.opt_local.shiftwidth = 2
        end
      '';
      desc = "Nix indent";
    }
    {
      event = [ "FileType" ];
      pattern = [ "c" "cpp" "h" "hpp" ];
      callback.__raw = ''
        function()
          vim.keymap.set(
            "n", 
            "<leader>co",
            "<cmd>ClangdSwitchSourceHeader<cr>",
            { buffer = true, desc = "Switch Source/Header" }
          )
        end
      '';
      desc = "Switch Source/Header";
    }
    {
      event = [ "FileType" ];
      pattern = [ "markdown" "txt" "gitcommit" "mail" ];
      callback.__raw = ''
        function()
          vim.opt_local.wrap = true;
          vim.opt_local.linebreak = true;
        end
      '';
      desc = "Enable Wrap for prose and markdown files";
    }
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
