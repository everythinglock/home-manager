{ settings, ... }:
let
  inherit (settings) format;
in
{
  plugins.conform-nvim = {
    enable = true;
    lazyLoad.settings.keys = [
      {
        __unkeyed-1 = "<leader>cf";
        __unkeyed-2.__raw = ''function() require("conform").format({ bufnr = 0, lsp_format = "fallback" }) end'';
        desc = "Format Current Buffer";
      }
    ];
    settings = {
      formatters_by_ft = {
        inherit (format)
          c
          cpp
          nix
          python
          ;
      };
    };
  };
}
