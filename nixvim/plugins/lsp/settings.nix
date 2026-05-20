{
  lsp = {
    c = "clangd";
    python = "ty";
    nix = "nil_ls";
    lua = "lua_ls";
  };
  diagnostics = {
    nix = "statix";
    go = "golangci_lint";
  };
  formatting = {
    c = "clang_format";
    go = "gofmt";
    goImport = "goimports";
    nix = "nixfmt";
    python = "black";
    pythonImport = "isort";
    rust = "rustfmt";
  };
}
