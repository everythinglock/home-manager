{
  autoCmd = [
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
  ];
}
