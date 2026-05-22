let
  cpp = "clangd";
  python = "ty";
  nix = "nil_ls";
  lua = "lua_ls";
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
      ${cpp}.enable = true;
      ${lua}.enable = true;
      ${nix}.enable = true;
      ${python}.enable = true;
    };
    keymaps.lspBuf = {
      "<leader>cr" = "rename";
      "<leader>ca" = "code_action";
      "K" = "hover";
    };
  };
}
