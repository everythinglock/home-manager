{
  autoCmd = [
    {
      event = [ "BufWritePre" ];
      pattern = "*";
      command = "lua vim.lsp.buf.format()";
      desc = "保存时自动格式化";
    }
    {
      event = [ "InsertEnter" ];
      pattern = "*";
      command = "set cursorline";
      desc = "进入插入模式时取消行高亮";
    }
    {
      event = [ "InsertLeave" ];
      pattern = "*";
      command = "set nocursorline";
      desc = "离开插入模式时高亮行";
    }
    {
      event = [ "BufReadPost" ];
      pattern = "*";
      command = ''
        if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
      '';
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
  ];
}
