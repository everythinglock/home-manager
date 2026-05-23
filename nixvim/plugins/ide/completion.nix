{
  plugins.friendly-snippets = {
    enable = true;
    lazyLoad.settings.event = "InsertEnter";
  };
  plugins.luasnip = {
    enable = true;
    lazyLoad.settings.event = "InsertEnter";
  };
  plugins.blink-cmp = {
    enable = true;
    settings = {
      completion = {
        menu.border = "rounded";
        documentation.window.border = "rounded";
        ghost_text.enabled = true;
      };
      keymap = {
        preset = "none";
        # 自定义键映射
        "<C-n>" = [
          "select_next"
          "fallback"
        ];
        "<C-p>" = [
          "select_prev"
          "fallback"
        ];
        "<C-space>" = [ "show" ];
        "<C-y>" = [ "accept" ];
        "<CR>" = [ "fallback" ];
        "<Tab>" = [
          "snippet_forward"
          "fallback"
        ];
        "<S-Tab>" = [
          "snippet_backward"
          "fallback"
        ];
      };

      # 补全源
      sources.default = [
        "path"
        "snippets"
        "lsp"
        "buffer"
      ];
      snippets.preset = "luasnip";
    };
  };
}
