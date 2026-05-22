{ settings, ... }:
let
  inherit (settings) lint;
in
{
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
      inherit (lint)
        c
        cpp
        python
        nix
        ;
    };
  };
}
