#WSL System Config!! 

{ config, lib, pkgs, ... }:

{
  networking.hostName = "sylph";
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    ../../system-config.nix 
  ];
  wsl.enable = true;
  wsl.defaultUser = "wych";

}
