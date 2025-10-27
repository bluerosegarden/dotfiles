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
   devbox
   direnv
   glow
   atuin
  ];


}
