{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		extra-modules.url = "./modules";
	};

	outputs = { self, nixpkgs, home-manager, extra-modules, ... }@inputs:
		let
			system = "x86_64-linux";

			pkgs = import nixpkgs {
				inherit system;

				config = {
					allowUnfree = true;
				};
			};
		in
		{
			nixosConfigurations = {
				laptop = nixpkgs.lib.nixosSystem{
					specialArgs = { inherit inputs; hardwareName = "surface"; };
					modules = [
						./hosts/surface/configuration.nix
						inputs.home-manager.nixosModules.default
					];
				};
			};
		};
}
