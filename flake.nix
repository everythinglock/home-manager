{
  description = "My Home Manager Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    # theme
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, catppuccin, ... }: 
  let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };
      pkgsUnstable = import nixpkgs-unstable {
        inherit system;
	config.allowUnfree = true;
      };
  in
  {
    homeConfigurations = {
      fd = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	extraSpecialArgs = {
	  inherit pkgsUnstable;
	  username = "fd";
	  dotDir = "dotfiles";
	  homeDir = "homefiles";
	};
        modules = [ ./home.nix ];
      };
    };
  };
}
