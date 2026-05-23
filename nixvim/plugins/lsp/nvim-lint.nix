{ pkgs, ... }:
let
  nix = {
    pkg = pkgs.statix;
    name = "statix";
  };
in
{
  extraPackages = [
    nix.pkg
  ];

  plugins.lint = {
    enable = true;
    lazyLoad.settings.event = "BufWritePre";
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
      nix = [ nix.name ];
    };
  };
}
