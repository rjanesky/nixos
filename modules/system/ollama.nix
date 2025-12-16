  { pkgs, ... }:

{
  services.ollama = {
    enable = true;

    # Ensure the actual ollama package is built with CUDA support
    #package = pkgs.ollama.override { acceleration = "cuda"; };

    package = pkgs.ollama-cuda;

    # And tell the service to use CUDA
    #acceleration = "cuda";

    # Optional: declaratively preload models (built-in option)
    loadModels = [ "llama3.1:8b" ];
  };
}
  
