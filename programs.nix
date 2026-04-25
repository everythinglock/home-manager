{ ... }: {
  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;

  imports = [
    ./programs/shell.nix

    ./programs/direnv.nix

    ./programs/terminal.nix

    ./programs/neovim.nix
  ];

}
