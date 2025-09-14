{ config, pkgs, ...}:
{
  home.username = "wych";
  home.homeDirectory = "/home/wych";
  home.packages = with pkgs; [
  ];

  imports = [ 
   ./default-pkgs-flake.nix
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      gideon = "echo griddle";
    };
  };
}
