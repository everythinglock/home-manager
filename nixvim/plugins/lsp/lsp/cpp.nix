let
  cpp = "clangd";
in
{
  plugins.lsp = {
    servers = {
      ${cpp} = {
        enable = true;
      };
    };
  };
}
