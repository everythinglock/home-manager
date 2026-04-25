{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    withNodeJs = true;
    extraPackages = with pkgs; [
      #base tool
      git
      gcc
      gnumake
      unzip
      curl

      # lazyvim tool
      ripgrep
      fd

      # lsp tool
      nodejs_24

      python313
      # lsp
      lua-language-server

      ruff
      pyright

      nil
      nixfmt
    ];
  };
}
