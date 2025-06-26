{
	description = "Ebin Nix config";

	inputs = {
		# Nixpkgs
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		# nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		# You can access packages and modules from different nixpkgs revs
		# at the same time. Here's an working example:
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		# nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
		# Also see the 'unstable-packages' overlay at 'overlays/default.nix'.
		# nix-gaming
		nix-gaming.url = "github:fufexan/nix-gaming";

		# Home manager
		home-manager.url = "github:nix-community/home-manager/release-25.05";
		# home-manager.url = "github:nix-community/home-manager/master";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		# Hardware
		nixos-hardware.url = "github:NixOS/nixos-hardware/master";

		# ROS
		# nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
		# nix-ros-overlay-pkgs.url = "github:lopsided98/nixpkgs/nix-ros";
		# ros.url = "github:clearpathrobotics/nix-ros";
		# ros-base.url = "github:clearpathrobotics/nix-ros-base";

		# Shameless plug: looking for a way to nixify your themes and make
		# everything match nicely? Try nix-colors!
		# nix-colors.url = "github:misterio77/nix-colors";

		stylix.url = "github:danth/stylix/release-25.05";
		# stylix.url = "github:danth/stylix/master";
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, nix-gaming, home-manager, nixos-hardware, stylix, ... }@ inputs:
	let
		inherit (self) outputs;
		# Supported systems for your flake packages, shell, etc.
		systems = [
			"aarch64-linux"
			"i686-linux"
			"x86_64-linux"
			"aarch64-darwin"
			"x86_64-darwin"
		];
		# This is a function that generates an attribute by calling a function you
		# pass to it, with each system as an argument
		forAllSystemsStable = nixpkgs.lib.genAttrs systems;
		forAllSystemsUnstable = nixpkgs-unstable.lib.genAttrs systems;
		# forAllSystemsStable2 = nixpkgs-stable.lib.genAttrs systems;
		forAllSystemsGaming = nix-gaming.lib.genAttrs systems;
		# forAllSystemsROS = nix-ros-overlay.inputs.lib.genAttrs systems;
	in {
		# Your custom packages
		# Accessible through 'nix build', 'nix shell', etc
		stablePackages = forAllSystemsStable (system: import ./pkgs nixpkgs.legacyPackages.${system});
		unstablePackages = forAllSystemsUnstable (system: import nixpkgs.legacyPackages.${system});
		# stable2Packages = forAllSystemsStable2 (system: import ./pkgs nixpkgs.legacyPackages.${system});
		gamingPackages = forAllSystemsGaming (system: import nixpkgs.lagacyPackages.${system});
		# forAllSystemsROS = forAllSystemsROS (system: import nixpkgs.legacyPackages.${system});
		# Formatter for your nix files, available through 'nix fmt'
		# Other options beside 'alejandra' include 'nixpkgs-fmt'
		formatter = forAllSystemsStable (system: nixpkgs.legacyPackages.${system}.alejandra);

		# Your custom packages and modifications, exported as overlays
		overlays = import ./overlays {inherit inputs;};
		# Reusable nixos modules you might want to export
		# These are usually stuff you would upstream into nixpkgs
		nixosModules = import ./modules/nixos;
		# Reusable home-manager modules you might want to export
		# These are usually stuff you would upstream into home-manager
		homeManagerModules = import ./modules/home-manager;

		# NixOS configuration entrypoint
		# Available through 'nixos-rebuild --flake .#your-hostname'
		nixosConfigurations = {
			laptop = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs outputs; };
				modules = [
					./nixos/configuration.nix
					inputs.home-manager.nixosModules.default
					# inputs.nixos-hardware.nixosModules.microsoft-surface-laptop-amd
					inputs.stylix.nixosModules.stylix
					({pkgs, ...}: {imports = [
						./nixos/devices/laptop/configuration.nix
						./nixos/devices/laptop/hardware-configuration.nix
					];})
				];
			};
			desktop = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs outputs; };
				modules = [
					./nixos/configuration.nix
					inputs.home-manager.nixosModules.default
					inputs.stylix.nixosModules.stylix
					({pkgs, ...}: {imports = [
						./nixos/devices/desktop/configuration.nix
						./nixos/devices/desktop/hardware-configuration.nix
					];})
				];
			};
			liveX86 = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs outputs; };
				modules = [
					(nixpkgs+"/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
					./nixos/configuration.nix
					inputs.home-manager.nixosModules.default
					inputs.stylix.nixosModules.stylix
					./nixos/devices/liveX86/configuration.nix
					./nixos/devices/liveX86/hardware-configuration.nix
				];
			};
		};

		# Standalone home-manager configuration entrypoint
		# Available through 'home-manager --flake .#your-username@your-hostname'
		# homeConfigurations = {
		#   # FIXME replace with your username@hostname
		#   "your-username@your-hostname" = home-manager.lib.homeManagerConfiguration {
		#     pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
		#     extraSpecialArgs = {inherit inputs outputs;};
		#     modules = [
		#       # > Our main home-manager configuration file <
		#       ./home-manager/home.nix
		#     ];
		#   };
		# };
	};
}
