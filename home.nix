{ username, ... }:
{
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };

  imports = [
    ./dotfiles.nix
    ./inputMethod.nix
    ./nixvim
    ./packages.nix
    ./programs
    ./sessions.nix
    ./ui.nix
  ];
}
