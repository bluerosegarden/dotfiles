
{ config, pkgs, ...}:
{
  programs.git.enable = true;
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    emacs
    ghostty
  ];

  services.emacs = {
    enable = true;
    package = pkgs.emacs; # replace with emacs-gtk, or a version provided by the community overlay if desired.
  };


  imports = [ 
    ./core.nix
  ];
}

