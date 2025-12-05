{ ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };


  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;  # see the note above
}