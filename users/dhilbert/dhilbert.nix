{ pkgs, ... }:

{
  users.users.dhilbert = {
    isNormalUser = true;
    description = "David Hilbert";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [ ];
  };
}