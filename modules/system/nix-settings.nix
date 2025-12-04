{ ... }:

{
  nix = {
    # Enable Experimental Features
    settings.experimental-features = [ "nix-command" "flakes" ];
    
    # Enable Garbage Collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    # Hard-link Identical Store Files (Utilize Storage Efficiently)
    optimise = {
      automatic = true;
      dates = "weekly";
    };
  };

  # Enable Unfree Software
  nixpkgs.config.allowUnfree = true;
}