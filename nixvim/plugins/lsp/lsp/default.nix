{
  imports = [
    ./cpp.nix
    ./javascript.nix
    ./json.nix
    ./nix.nix
    ./python.nix
  ];
  plugins.lsp = {
    enable = true;
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];
    inlayHints = true;
    lazyLoad.settings.keys = [
      { __unkeyed-1 = "<leader>ca"; __unkeyed-2.__raw = "function() vim.lsp.buf.code_action() end"; desc = "Lsp buf code action"; }
      { __unkeyed-1 = "<leader>cr"; __unkeyed-2.__raw = "function() vim.lsp.buf.rename() end"; desc = "Lsp buf rename"; }
      { __unkeyed-1 = "<C-k>"; __unkeyed-2.__raw = "function() vim.lsp.buf.hover() end"; desc = "Lsp buf code action"; }
      {
        __unkeyed-1 = "K";
        __unkeyed-2.__raw = ''
          function()
            -- 安全检测：如果你已经在悬浮窗内部了，按 K 会自动跳回主代码窗口
            if vim.api.nvim_win_get_config(0).relative ~= "" then
              vim.cmd("wincmd p")
              return
            end
            -- 检测当前屏幕上是否已经弹出了任何悬浮窗（如 LSP 文档弹窗）
            local has_float = false
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
              local config = vim.api.nvim_win_get_config(win)
              if config.relative ~= "" and config.focusable then
                has_float = true
                break
              end
            end
            -- 智能逻辑分流：
            if has_float then
              -- 如果屏幕上已经有弹窗了（第 2 次按 K），弹出该行的 LSP 诊断报错
              vim.diagnostic.open_float()
            else
              -- 如果没有任何弹窗（第 1 次按 K），调用 LSP Hover 文档
              -- 如果 LSP 没启动（比如在普通文本里），则降级调用 Neovim 原生的帮助/Man手册动作
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              if #clients == 0 then
                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("K", true, true, true), "n", true)
              else
                  vim.lsp.buf.hover()
              end
            end
          end
        '';
        desc = "Lsp buf rename";
      }
    ];
  };
}
