{ pkgs, username, ... }: {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  imports = [
    ./packages.nix
    ./dotfiles.nix
    ./programs.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "$HOME/.nix-profile/bin"
  ];

}
