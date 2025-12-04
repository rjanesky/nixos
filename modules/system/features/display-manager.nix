{ lib, config, pkgs, ... }:
let
  cfg = config.features.display-manager;
in
{
  options.features.display-manager.enable =
    lib.mkEnableOption "Manage login via display manager";

  config = lib.mkIf cfg.enable {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
  };
}
