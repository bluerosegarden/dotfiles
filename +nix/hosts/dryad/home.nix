
## SERVER home config
{ config, pkgs, ...}:

let 
  env_vars = (builtins.fromTOML (builtins.readFile ./env.toml));
in

{
  home.username = "${env_vars.username}";
  home.homeDirectory = "/home/${env_vars.username}";

  home.packages = with pkgs; [
    caddy
  ];

  imports = [ 
   ./default-pkgs-flake.nix
  ];

}
