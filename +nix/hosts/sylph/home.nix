# WSL Home manager!!

{ config, pkgs, rustowl-flake, ...}:
{
  home.username = "wych";
  home.homeDirectory = "/home/wych";

  home.packages = with pkgs; [
    rustowl-flake.packages."${system}".default
  ];

  imports = [ 
   ../../core.nix
   ../../core-gui.nix
  ];

}
