{
  description = "hilbert-space config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable"; 

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    
    # Development Shells
    devShells.x86_64-linux = let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
      # `nix develop` or `nix develop .#default`
      #default = pkgs.mkShell {
      #  packages = with pkgs; [
      #    git
      #  ];
      # shellHook = ''
      #    echo "Default dev shell (x86_64-linux)"
      #  '';
      #};

      # `nix develop .#rust`
      rust = pkgs.mkShell {
        packages = with pkgs; [
          rustc
          cargo
          rust-analyzer
          pkg-config
        ];
        shellHook = ''
          echo "Rust dev shell (cargo, rustc, rust-analyzer)"
        '';
      };

      # `nix develop .#python`
      python = pkgs.mkShell {
        packages = with pkgs; [
          python3
          python3Packages.ipython
          python3Packages.virtualenv
        ];
        shellHook = ''
          echo "Python dev shell (python3 + ipython + virtualenv)"
        '';
      };
    };

    # ───── System Definitions ─────────────────────────────────────────
    nixosConfigurations.hilbert-space-mobile = nixpkgs.lib.nixosSystem {
     
      specialArgs = { inherit inputs; };

      modules = [
        # Configuration
        ./hosts/hilbert-space-mobile/configuration.nix
        
        # Users
        ./users/dhilbert/dhilbert.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;  

          # Args exposed specifically to HM modules:
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };

          home-manager.users.dhilbert = import ./users/dhilbert/home.nix;
        }
        
        { networking.hostName = "hilbert-space-mobile"; }
      ];
    };

    nixosConfigurations.banach-space = nixpkgs.lib.nixosSystem {
     
      specialArgs = { inherit inputs; };

      modules = [
        # Configuration
        ./hosts/banach-space/configuration.nix
        
        # Users
        ./users/dhilbert/dhilbert.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;  

          # Args exposed specifically to HM modules:
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };

          home-manager.users.dhilbert = import ./users/dhilbert/home.nix;
        }
        
        { networking.hostName = "banach-space"; }
      ];
    };

    # ───── System Definitions ─────────────────────────────────────────
    nixosConfigurations.hilbert-space = nixpkgs.lib.nixosSystem {
     
      specialArgs = { inherit inputs; };

      modules = [
        # Configuration
        ./hosts/hilbert-space/configuration.nix
        
        # Users
        ./users/dhilbert/dhilbert.nix
        ./users/dhilbert-remote/dhilbert-remote.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;  

          # Args exposed specifically to HM modules:
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };

          home-manager.users.dhilbert = import ./users/dhilbert/home.nix;
          home-manager.users.dhilbert-remote = import ./users/dhilbert-remote/home.nix;
        }
        
        { networking.hostName = "hilbert-space"; }
      ];
    };
  };
}