{ pkgs, ... }:

{
  services.journald.extraConfig = ''
    Storage=persistent
    SystemMaxUse=1G
  '';

  boot.kernel.sysctl."kernel.pstore.enabled" = 1;
  boot.kernelParams = [
    "pstore.backend=ramoops"
    "ramoops.mem_address=0x110000"
    "ramoops.mem_size=0x100000"
  ];
}