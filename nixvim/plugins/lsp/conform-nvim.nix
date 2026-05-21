{ settings, ... }:
let
  inherit (settings) format;
in
{
  plugins.conform-nvim = {
    enable = true;
    lazyLoad.settings.event = [
      "BufNewFile"
      "BufReadPost"
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
      format_on_save = {
        timeout_ms = 2500;
        lsp_format = "fallback";
      };
    };
  };
}
