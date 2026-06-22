{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }: {

    darwinConfigurations."dadabook" = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };
      modules = [ ./configuration.nix ];
    };

  };
}
