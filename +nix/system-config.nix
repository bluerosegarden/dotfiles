{ config, lib, pkgs, ... }:

{
  imports = [
  ];
  virtualisation.docker.enable = true;
  programs.zsh.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?
  users.users.wych = {
    isNormalUser = true;
    description = "wych";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    # Flakes clones its dependencies through the git command,
    # so git must be installed first
    git
    vim
    neovim
    wget
  ];
  # Set the default editor to vim
  environment.variables.EDITOR = "nvim"; 
}
