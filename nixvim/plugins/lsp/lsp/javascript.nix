let
  javascript = "vtsls";
in
{
  plugins.lsp = {
    servers = {
      ${javascript}.enable = true;
    };
  };
}
