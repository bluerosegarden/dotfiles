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

    nixosConfigurations.sylph = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/sylph/system-config.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
	          useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit rustowl-flake; };
            users.wych = import ./hosts/sylph/home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
  };
  
    nixosConfigurations.dryad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/dryad/system-config.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
	          useGlobalPkgs = true;
            useUserPackages = true;
            users.wych = import ./hosts/dryad/home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
