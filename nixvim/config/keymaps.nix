{
  globals.mapleader = " ";
  keymaps = [
    # ═══════════════════════════════════════
    #  📁 Save/Quit
    # ═══════════════════════════════════════
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>bs";
      action = "<cmd>w<CR>";
      options = {
        desc = "Save file";
      };
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
      key = "<leader>bd";
      action = "<cmd>bd<CR>";
      options = {
        desc = "Delete buffer";
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
    #  📋 Tab
    # ═══════════════════════════════════════
    {
      mode = "n";
      key = "<leader>tn";
      action = "<cmd>tabnew<CR>";
      options.desc = "New tab";
    }
    {
      mode = "n";
      key = "<leader>tc";
      action = "<cmd>tabclose<CR>";
      options.desc = "Close tab";
    }
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>tabprevious<CR>";
      options.desc = "Previous tab";
    }
    {
      mode = "n";
      key = "<leader>tl";
      action = "<cmd>tabnext<CR>";
      options.desc = "Next tab";
    } # 用 tl 避免和 tn 冲突
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
    {
      mode = "n";
      key = "<leader>sv";
      action = "<C-w>v";
      options = {
        desc = "Split vertical";
      };
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = "<C-w>s";
      options = {
        desc = "Split horizontal";
      };
    }
    {
      mode = "n";
      key = "<leader>se";
      action = "<C-w>=";
      options = {
        desc = "Equalize splits";
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
    {
      mode = "n";
      key = "<leader>yr";
      action = "<cmd>reg<CR>";
      options.desc = "Show registers";
    }
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
      mode = [
        "n"
        "v"
      ];
      key = "<leader>yp";
      action = ''"+p'';
      options.desc = "Paste after cursor (system)";
    }
    {
      mode = [
        "n"
        "v"
      ];
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
      key = "<leader>fc";
      action = "<cmd>e $HOME/.config/nvim/init.lua<CR>";
      options = {
        desc = "Reload current file";
      };
    }
  ];
}
