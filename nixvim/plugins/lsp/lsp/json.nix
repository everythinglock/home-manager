let
  json = "jsonls";
in
{
  plugins.lsp = {
    servers = {
      ${json}.enable = true;
    };
  };
}
