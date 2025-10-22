{
  description = "A witch's codebook";
  inputs ={
    nixpkgs.url = "nixpkgs/nixos-unstable";
    rustowl-flake.url = "github:nix-community/rustowl-flake"; # Replace with the actual URL
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows ="nixpkgs";
    };
  };

  outputs = {self, nixpkgs, home-manager, rustowl-flake, ...}:

  let 
    env_vars = (builtins.fromTOML (builtins.readFile ./env.toml));
  in
  {

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
            users = {
              "${env_vars.username}" = import ./hosts/sylph/home.nix;
            };
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
            users = {
              "${env_vars.username}" = import ./hosts/dryad/home.nix;
            };
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
