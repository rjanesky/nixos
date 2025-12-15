{ pkgs, ... }:

{
  users.users.dhilbert-remote = {
    isNormalUser = true;
    description = "David Hilbert";
    extraGroups = [ "audio"  ];
    packages = with pkgs; [ ];
  };
}