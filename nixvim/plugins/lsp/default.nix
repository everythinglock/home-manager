{ pkgs, ... }:
{
  imports = [
    ./diagnostics.nix
    ./conform-nvim.nix
    ./nvim-lint.nix
    ./lsp.nix
    ./trouble.nix
  ];

  extraPackages = with pkgs; [
    # c/cpp
    clang-tools
    # nix
    nixfmt # format
    statix # lint
    # python
    ruff # lint/format
  ];

  _module.args.settings = {
    lsp = {
      c = "clangd";
      cpp = "clangd";
      python = "ty";
      nix = "nil_ls";
      lua = "lua_ls";
    };
    lint = {
      c = [ "clangtidy" ];
      cpp = [ "clangtidy" ];
      nix = [ "statix" ];
      python = [ "ruff" ];
    };
    format = {
      c = [ "clang-format" ];
      cpp = [ "clang-format" ];
      nix = [ "nixfmt" ];
      python = [
        "black"
        "isort"
      ];
    };
  };
}
