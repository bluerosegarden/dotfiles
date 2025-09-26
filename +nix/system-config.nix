{ config, lib, pkgs, ... }:

let 
  env_vars = (builtins.fromTOML (builtins.readFile ./env.toml));
in
{
  imports = [ 
  ];

  virtualisation.docker.enable = true;
  programs.zsh.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?
  networking.hostName = "${env_vars.hostname}";
  users.users= {
    "${env_vars.username}" = {
      isNormalUser = true;
      description = "${env_vars.username}";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      shell = pkgs.zsh;
    };
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
