{
  # ========== Neovim 原生配置 ==========
  opts = {
    number = true; # 显示行号
    relativenumber = true; # 相对行号（便于跳转）
    shiftwidth = 4; # 缩进宽度
    tabstop = 4; # Tab 宽度
    expandtab = true; # 将 Tab 转换为空格
    mouse = "a"; # 启用鼠标支持
    # clipboard = "unnamedplus";  # 系统剪贴板
    ignorecase = true; # 搜索忽略大小写
    smartcase = true; # 若包含大写则大小写敏感
    laststatus = 3; # 开启全局状态栏
    undofile = true; # 持久撤销
    hlsearch = true; # 搜索高亮
    incsearch = true; # 增量搜索
    termguicolors = true; # 真彩色
    scrolloff = 8; # 光标距屏幕边界行数
    signcolumn = "yes"; # 始终显示标记列（避免抖动）
    # cursorline = true;            # 高亮当前行，定位更快
    splitright = true; # 垂直分屏时新窗口在右侧
    splitbelow = true; # 水平分屏时新窗口在下方
    winblend = 10; # 浮动窗口半透明（需终端支持）
    pumblend = 10; # 补全菜单半透明
    timeoutlen = 500; # 按键序列等待时间（毫秒），让快捷键响应更快
    updatetime = 200; # 交换文件写入和 CursorHold 事件延迟
    swapfile = false; # 不使用交换文件（可选，配合 undofile 够用）
    backup = false; # 不生成备份文件
    writebackup = false; # 写入时不备份
    completeopt = "menu,menuone,noselect"; # 补全菜单行为（无插件也能用）
    conceallevel = 0; # 不隐藏 markdown 等语法字符
    showmode = false; # 状态栏插件会显示模式，关闭原生提示避免重复
    sessionoptions = "buffers,curdir,tabpages,winpos,winsize"; # 会话保存内容
  };

  globals = {
    mapleader = " ";
    maplocalleader = "\\";
  };
}
