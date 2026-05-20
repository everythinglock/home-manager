{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    btop
    dust
    eza
    fd
    git
    jq
    lazygit
    ripgrep
    tldr
    yazi
  ];
  imports = [
    ./direnv.nix
    ./fzf.nix
    ./starship.nix
    ./terminal.nix
    ./zoxide.nix
    ./zsh.nix
  ];
}
