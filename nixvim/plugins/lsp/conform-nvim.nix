{ pkgs, ... }:
let
  c = {
    pkg = pkgs.clang-tools;
    name = "clang-format";
  };
  nix = {
    pkg = pkgs.nixfmt;
    name = "nixfmt";
  };
  python = {
    pkg = pkgs.ruff;
    name = "ruff_format";
  };
in
{
  extraPackages = [
    c.pkg
    nix.pkg
    python.pkg
  ];

  plugins.conform-nvim = {
    enable = true;
    lazyLoad.settings.event = [
      "BufWritePre"
    ];
    lazyLoad.settings.keys = [
      {
        __unkeyed-1 = "<leader>cf";
        __unkeyed-2.__raw = ''function() require("conform").format({ bufnr = 0, lsp_format = "fallback" }) end'';
        desc = "Format Current Buffer";
      }
    ];
    settings = {
      formatters_by_ft = {
        c = [ c.name ];
        cpp = [ c.name ];
        nix = [ nix.name ];
        python = [ python.name ];
      };
    };
  };

  autoCmd = [
    {
      event = "BufWritePre";
      pattern = [
        "*.c"
        "*.cpp"
        "*.py"
      ];
      callback.__raw = ''function() require("conform").format({ bufnr = 0, lsp_format = "fallback" }) end'';
      desc = "Auto format on save";
    }
  ];
}
