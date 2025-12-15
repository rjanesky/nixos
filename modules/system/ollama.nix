  { pkgs, ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "cuda"; # uses your NVIDIA GPU
  };
}
  
