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

      # lazyvim tool
      ripgrep
      fd

      # lsp tool
      nodejs_24

      python313

      # lsp
      lua-language-server
      stylua

      pyright
      ruff

      nil
      nixfmt
      statix

      shfmt

      cmake-lint
      neocmakelsp
    ];
  };
}
