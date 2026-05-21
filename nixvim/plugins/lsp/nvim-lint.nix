{ settings, ... }:
let
  inherit (settings) lint;
in
{
  plugins.lint = {
    enable = true;
    lazyLoad.settings.event = [
      "BufNewFile"
      "BufReadPost"
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

  autocmd = [
    {
      callback.__raw = ''
        function()
            require("lint").try_lint()
        end
      '';
      event = [
        "BufWritePost"
        "BufReadPost"
        "InsertLeave"
      ];
    }
  ];
}
