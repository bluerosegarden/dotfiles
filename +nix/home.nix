
{ config, pkgs, rustowl-flake, ...}:
{
  home.username = "wych";
  home.homeDirectory = "/home/wych";

  home.packages = with pkgs; [
    rustowl-flake.packages."x86_64-linux".default
  ];

  imports = [ 
   ./default-pkgs-flake.nix
  ];

}
