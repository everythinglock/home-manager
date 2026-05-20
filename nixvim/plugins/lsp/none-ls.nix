let
  inherit (import ./settings.nix) diagnostics formatting;
in
{
  plugins.none-ls = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    sources = {
      diagnostics = {
        # Nix 静态分析
        ${diagnostics.nix}.enable = true;
        # Go 代码质量检查
        ${diagnostics.go}.enable = true;
      };
      formatting = {
        # Nix
        ${formatting.nix}.enable = true;
        # Go
        ${formatting.go}.enable = true;
        ${formatting.goImport}.enable = true;
        # python
        ${formatting.python}.enable = true;
        ${formatting.pythonImport}.enable = true;
        # C / C++
        ${formatting.c}.enable = true;
        # Rust
        ${formatting.rust}.enable = true;
      };
    };
  };
}
