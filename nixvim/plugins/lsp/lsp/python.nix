{ pkgs, ... }:
let
  nixvimPython = pkgs.python3.withPackages (ps: [
    ps.rich
    ps.requests
  ]);
  python = "basedpyright";
  python_minor = "ruff";
in
{
  plugins.lsp = {
    servers = {
      ${python}.enable = true;
      ${python_minor}.enable = true;
    };
  };
  extraPackages = [
    nixvimPython
  ];
}
