{ pkgs, ... }:
{
  services.xrdp = {
    enable = true;
    openFirewall = false;
  };

  networking.firewall.interfaces.tailscale0.allowedTCPPorts = [ 3389 ];

  users.users.rdp = {
    isNormalUser = true;
    description = "XRDP remote desktop user";
    createHome = true;
    home = "/home/rdp";
  };

  environment.systemPackages = with pkgs; [
    xorg.xauth
    xorg.xhost
  ];

  home-manager.users.rdp = { pkgs, ... }: {
    home.stateVersion = "25.05";

    # Packages visible only to rdp (not your main user)
    home.packages = with pkgs; [
      xfce.xfce4-session
      xfce.xfce4-panel
      xfce.xfce4-settings
      xfce.thunar
    ];

    # XRDP uses this to start the session
    home.file.".xsession" = {
      text = ''
        exec startxfce4
      '';
      executable = true;
    };
  };
}

