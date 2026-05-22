{ pkgs, ... }:
let
  c = {
    pkg = pkgs.clang-tools;
    name = "clangtidy";
  };
  nix = {
    pkg = pkgs.statix;
    name = "statix";
  };
  python = {
    pkg = pkgs.ruff;
    name = "ruff";
  };
in
{
  extraPackages = [
    c.pkg
    nix.pkg
    python.pkg
  ];

  plugins.lint = {
    enable = true;
    lazyLoad.settings.event = [
      "BufWritePre"
    ];
    lazyLoad.settings.keys = [
      {
        __unkeyed-1 = "<leader>cl";
        __unkeyed-2.__raw = ''
          function()
              local ok, lint = pcall(require, "lint")
              if ok then lint.try_lint() end
          end
        '';
        desc = "Lint";
      }
    ];
    lintersByFt = {
      c = [ c.name ];
      cpp = [ c.name ];
      nix = [ nix.name ];
      python = [ python.name ];
    };
  };
}
