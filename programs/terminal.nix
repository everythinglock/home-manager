{ ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Catppuccin Mocha";
      font-size = 12;
      background-opacity = 0.95;

      confirm-close-surface = false;
      copy-on-select = true;
    };
  };
}
