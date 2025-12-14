{ pkgs, ... }:

{
  users.users.dhilbert-remote = {
    isNormalUser = true;
    description = "David Hilbert";
    extraGroups = [  ];
    packages = with pkgs; [ ];
  };
}