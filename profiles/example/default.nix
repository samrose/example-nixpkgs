{ config, lib, pkgs, ... }:

with pkgs;

let
  inherit (config.system.example) target;
in

{
  imports = [
    ../.
    ../self-aware.nix
  ];


  documentation.enable = false;

  environment.noXlibs = true;

  #environment.systemPackages = [
  #  (holoport-hardware-test.override { inherit target; })
  #];

  networking.hostName = lib.mkOverride 1100 "example";

  nix.binaryCaches = [
    "https://cache.nixos.org"
  ];


  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  security.sudo.wheelNeedsPassword = false;

  services.avahi = {
    enable = true;

    publish = {
      enable = true;
      addresses = true;
    };
  };
 
  services.mingetty.autologinUser = "root";

  services.openssh.enable = true;
  
  system.example.autoUpgrade = {
    enable = true;
    dates = "*:0/10";
  };

  system.stateVersion = "19.09";

  users.mutableUsers = false;


  users.users.root.hashedPassword = "*";

}
