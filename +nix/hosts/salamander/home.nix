# WSL Home manager!!

{ config, pkgs, rustowl-flake, ...}:

let 
  env_vars = (builtins.fromTOML (builtins.readFile ../../env.toml));
in
{
  home.username = "${env_vars.username}";
  home.homeDirectory = "/home/${env_vars.username}";

  home.packages = with pkgs; [
    rustowl-flake.packages."${system}".default
    kdePackages.karousel
    kdePackages.kwin
    obsidian
    syncthing
    syncthingtray
  ];

  imports = [ 
   ../../core.nix
   ../../core-gui.nix
  ];

}
