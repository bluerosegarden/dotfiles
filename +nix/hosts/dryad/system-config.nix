# Server Config!
{ config, lib, pkgs, ... }:

{
  imports = [
    ../../system-config.nix
  ];

  environment.systemPackages = with pkgs; [
  ];
}
