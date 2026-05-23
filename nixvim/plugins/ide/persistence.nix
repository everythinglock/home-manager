{
  plugins.persistence = {
    enable = true;

    settings = {
      # 只有打开了 2 个及以上的 buffers 时才在退出时自动保存会话
      need_2_buffers = true; 
    };

    lazyLoad.settings.event = "VimLeavePre";
    lazyLoad.settings.keys = [
      {
        mode = "n";
        __unkeyed-1 = "<leader>rs";
        __unkeyed-2.__raw = ''function() require("persistence").load() end'';
        desc = "Restore Session for Current Directory";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>rr";
        __unkeyed-2.__raw = ''function() require("persistence").load({ last = true }) end'';
        desc = "Restore Last Session";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>rS"; 
        __unkeyed-2.__raw = ''function() require("persistence").select() end'';
        desc = "Select Session from List";
      }
      {
        mode = "n";
        __unkeyed-1 = "<leader>rd"; 
        __unkeyed-2.__raw = ''function() require("persistence").stop() end'';
        desc = "Don't Save Current Session on Quit";
      }
    ];
  };
}
