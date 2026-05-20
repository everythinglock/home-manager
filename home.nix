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
    ./shell

    ./packages.nix
    ./sessions.nix
    ./ui.nix
  ];
}
