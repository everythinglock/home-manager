{
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        color_overrides = {
          mocha = {
            base = "#1e1e2f";
          };
        };
        disable_underline = true;
        flavour = "mocha";
        integrations = {
          gitsigns = true;
          treesitter = true;
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
