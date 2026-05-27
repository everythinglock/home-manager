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
  ];
}
