# Server Config!
{ config, lib, pkgs, ... }:

{
  imports = [
    ../../system-config.nix
  ];
  networking.hostName = "dryad";

  environment.systemPackages = with pkgs; [
  ];
}
