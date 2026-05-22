{ username, ... }:
{
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };

  imports = [
    ./applications
    ./homefiles
    ./nixvim
    ./cli

    ./packages.nix
    ./sessions.nix
    ./ui.nix
  ];
}
