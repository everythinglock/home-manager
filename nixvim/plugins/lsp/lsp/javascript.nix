let
  js = "vtsls";
in
{
  plugins.lsp = {
    servers = {
      ${js}.enable = true;
    };
  };
}
