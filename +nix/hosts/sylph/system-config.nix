#WSL System Config!! 

{ config, lib, pkgs, ... }:

let 
  env_vars = (builtins.fromTOML (builtins.readFile ../../env.toml));
in
{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    ../../system-config.nix 
  ];
  wsl.enable = true;
  wsl.defaultUser = "${env_vars.username}";

}
