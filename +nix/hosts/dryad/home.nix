
## SERVER home config
{ config, pkgs, ...}:
{
  home.username = "wych";
  home.homeDirectory = "/home/wych";

  home.packages = with pkgs; [
    caddy
  ];

  imports = [ 
   ./default-pkgs-flake.nix
  ];

}
