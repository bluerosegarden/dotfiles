{
  description = "A witch's codebook";
  inputs ={
    nixpkgs.url = "nixpkgs/nixos-25.05";
    rustowl-flake.url = "github:nix-community/rustowl-flake"; # Replace with the actual URL
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows ="nixpkgs";
    };
  };
  

  outputs = {self, nixpkgs, home-manager, rustowl-flake, ...}:{

    nixosConfigurations.spellbook = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
	          useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit rustowl-flake; };
            users.wych = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
  };
};
}
