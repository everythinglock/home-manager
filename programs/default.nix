{
  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;

  imports = [
    ./shell.nix
    ./direnv.nix
    ./terminal.nix
  ];

}
