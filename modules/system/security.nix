{ pkgs, ... }:
{
  networking.firewall = {
    enable = true;

    interfaces.tailscale0 = {
      allowedTCPPorts = [ 22 3389 ];
    };
  };

  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      X11Forwarding = false;
    };

    openFirewall = false;
  };

  boot.kernelParams = [ "intel_iommu=on" "amd_iommu=on" "iommu.strict=1" ];

  boot.kernel.sysctl = {
    "kernel.kptr_restrict" = 1;
    "kernel.dmesg_restrict" = 1;
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
    "net.ipv4.tcp_syncookies" = 1;
  };

  # Hardware key 
  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [
    yubikey-manager
    yubikey-personalization
    pam_u2f
  ];

  # Crypto
  hardware.ledger.enable = true;

  services.udev.packages = [
    pkgs.ledger-udev-rules
  ];
}