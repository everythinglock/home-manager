{ settings, ... }:
let
  inherit (settings) lsp;
in
{
  plugins.lsp = {
    enable = true;
    lazyLoad.settings.event = [
      "BufNewFile"
      "BufReadPost"
    ];
    inlayHints = true;
    servers = {
      ${lsp.c}.enable = true;
      ${lsp.lua}.enable = true;
      ${lsp.nix}.enable = true;
      ${lsp.python}.enable = true;
    };
    keymaps.lspBuf = {
      "gd" = "definition";
      "gD" = "references";
      "gt" = "type_definition";
      "gi" = "implementation";
      "<leader>ln" = "rename";
      "<leader>la" = "code_action";
      "K" = "hover";
    };
  };
}
