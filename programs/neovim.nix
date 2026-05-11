{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = false;
    withPython3 = true;
    withNodeJs = true;
    extraPackages = with pkgs; [
      #base tool
      git
      gcc
      gnumake
      unzip
      curl
      luajit
      nodejs
      python313
      ripgrep
      fd

      # lsp
      lua-language-server
      stylua

      pyright
      ruff

      nil
      nixfmt
      statix

      shfmt
    ];
  };
}
