{ pkgs, lib, ... }:
let
  terminalTools = {
    modernCli = {
      cat = pkgs.bat;
      ls = pkgs.eza;
      find = pkgs.fd;
      grep = pkgs.ripgrep;
    };

    system = {
      monitor = pkgs.btop;
      diskUsage = pkgs.dust;
    };

    git = {
      cli = pkgs.git;
      tui = pkgs.lazygit;
    };

    fileManager = {
      tui = pkgs.yazi;
      unzip = pkgs.unzip;
    };

    utilities = {
      jsonParser = pkgs.jq;
    };
  };
in
{
  home.packages = lib.collect lib.isDerivation terminalTools;

  imports = [
    ./bash.nix
    ./direnv.nix
    ./fzf.nix
    ./starship.nix
    ./terminal.nix
    ./zoxide.nix
    ./zsh.nix
  ];
}
