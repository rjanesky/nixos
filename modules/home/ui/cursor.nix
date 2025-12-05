{ config, pkgs, ... }:
 {
    home.pointerCursor = {
    name = "Vanilla-DMZ";
    size = 24;
    package = pkgs.vanilla-dmz;  # correct Nixpkgs package
  };
 }