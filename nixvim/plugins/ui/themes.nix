{
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        color_overrides.mocha.base = "#1e1e2f";
        disable_underline = true;
        flavour = "mocha";
        integrations = {
          blink_cmp = true;
          gitsigns = true;
          noice = true;
          snacks = true;
          treesitter = true;
          trouble = true;
          which-key = true;
        };
        styles = {
          booleans = [
            "bold"
            "italic"
          ];
          conditionals = [
            "bold"
          ];
        };
        term_colors = true;
      };
    };
  };
}
