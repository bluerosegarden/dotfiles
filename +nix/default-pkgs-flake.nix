{ config, pkgs, ...}:
{
  programs.git.enable = true;
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
   nnn
   gum
   bat
   ripgrep
   eza
   glow
   docker
   gnumake
   emacs
   yadm
   neovim
   zip
   unzip
   clang
   rustup
   cargo-binstall
   gnupg
   zsh
   zig
   starship
   git-identity
  ];

  services.emacs = {
    enable = true;
    package = pkgs.emacs; # replace with emacs-gtk, or a version provided by the community overlay if desired.
  };

}
