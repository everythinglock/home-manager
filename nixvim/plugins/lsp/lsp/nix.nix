let
  nix = "nixd";
in
{
  plugins.lsp = {
    servers = {
      ${nix}.enable = true;
    };
  };
}
