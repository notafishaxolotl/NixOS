{
  
  description = "the one to start 'em all";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
        
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };
  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, spicetify-nix, zen-browser, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsUnstable = nixpkgs-unstable.legacyPackages.${system};
    in{
    nixosConfigurations = {
      Nix = lib.nixosSystem {
        inherit system; 
	modules = [ 
	  ./nixos/configuration.nix
	];
	specialArgs = {
          pkgs-unstable = nixpkgs-unstable.legacyPackages.${pkgs.system};
        };
      };
    };
    homeConfigurations = {
        acito = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };  # ADD THIS LINE
          modules = [ 
	    ./home.nix
	    spicetify-nix.homeManagerModules.default
	  ];
        };
      };
    };
}
