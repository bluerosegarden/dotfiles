{ config, pkgs, ...}:
{
  programs.git.enable = true;
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
   nnn
   gum
   ripgrep
   eza
   glow
   docker
   emacs
   yadm
   neovim
   zip
   unzip
   clang
   gcc
   rust
   gnupg
   zsh
   starship
   git-identity
  ];

  services.emacs = {
    enable = true;
    package = pkgs.emacs; # replace with emacs-gtk, or a version provided by the community overlay if desired.
  };

}
