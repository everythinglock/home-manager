{
  plugins.nvim-autopairs = {
    enable = true;
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];
    settings = {
      disable_filetype = [
        "TelescopePrompt"
        "vim"
      ];
    };
  };
}
