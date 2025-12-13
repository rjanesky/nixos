{ pkgs, ... }:

{
  users.users.rdp = {
    isNormalUser = true;
    description = "RDP User";
    extraGroups = [ ];

    packages = with pkgs; [
      wayvnc
      wl-clipboard
    ];
  };

  # Only allow VNC over Tailscale
  networking.firewall.interfaces.tailscale0.allowedTCPPorts = [ 5901 ];

  };
}