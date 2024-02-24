# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs, outputs, lib, config, pkgs, ... }:

{
	# You can import other NixOS modules here
	imports = [
		# If you want to use modules your own flake exports (from modules/nixos):
		# outputs.nixosModules.example

		# Or modules from other flakes (such as nixos-hardware):
		# inputs.hardware.nixosModules.common-cpu-amd
		# inputs.hardware.nixosModules.common-ssd
	];

	nixpkgs = {
		# You can add overlays here
		# overlays = [
		# 	# Add overlays your own flake exports (from overlays and pkgs dir):
		# 	outputs.overlays.additions
		# 	outputs.overlays.modifications
		# 	outputs.overlays.unstable-packages
		# 	outputs.overlays.postman

		# 	# You can also add overlays exported from other flakes:
		# 	# neovim-nightly-overlay.overlays.default

		# 	# Or define it inline, for example:
		# 	# (final: prev: {
		# 	#   hi = final.hello.overrideAttrs (oldAttrs: {
		# 	#     patches = [ ./change-hello-to-hi.patch ];
		# 	#   });
		# 	# })
		# ];
		# Configure your nixpkgs instance
		config = {
			# Disable if you don't want unfree packages
			allowUnfree = true;
		};
	};

	# This will add each flake input as a registry
	# To make nix3 commands consistent with your flake
	nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

	# This will additionally add your inputs to the system's legacy channels
	# Making legacy nix commands consistent as well, awesome!
	nix.nixPath = ["/etc/nix/path"];
	environment.etc =
		lib.mapAttrs'
		(name: value: {
			name = "nix/path/${name}";
			value.source = value.flake;
		})
		config.nix.registry;

	nix.settings = {
		# Enable flakes and new 'nix' command
		experimental-features = "nix-command flakes";
		# Deduplicate and optimize nix store
		auto-optimise-store = true;
	};


	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Swap
	swapDevices = [{
		device = "/var/lib/swapfile";
		size = 16*1024;
	}];

	# Networking
	networking = {
		networkmanager.enable = true;
	};

	# Time Zone
	time.timeZone = "America/New_York";

	# Internationalisation Properties
	i18n = {
		defaultLocale = "en_US.UTF-8";
		extraLocaleSettings = {
			LC_ADDRESS = "en_US.UTF-8";
			LC_IDENTIFICATION = "en_US.UTF-8";
			LC_MEASUREMENT = "en_US.UTF-8";
			LC_MONETARY = "en_US.UTF-8";
			LC_NAME = "en_US.UTF-8";
			LC_NUMERIC = "en_US.UTF-8";
			LC_PAPER = "en_US.UTF-8";
			LC_TELEPHONE = "en_US.UTF-8";
			LC_TIME = "en_US.UTF-8";
		};
	};

	# Services
	services = {
		xserver = {
			enable = true;
			displayManager.gdm = {
				enable = true;
				wayland = true;
			};
			xkb = {
				layout = "us";
				variant = "";
			};

			# Enable touchpad support
			libinput.enable = true;
		};

		# Enable CUPS to print documents
		printing.enable = true;

		# Enable Thumb drives
		gvfs.enable = true;
		udisks2.enable = true;
	};

	# Sound with Pipewire
	sound.enable = true;
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# If you want to use JACK applications, uncomment this
		#jack.enable = true;

		# use the example session manager (no others are packaged yet so this is enabled by default,
		# no need to redefine it in your config for now)
		#media-session.enable = true;
	};

	# Users
	users.users.garrett = {
		isNormalUser = true;
		description = "Garrett Tupper";
		extraGroups = [ "networkmanager" "wheel" "docker" ];
		shell = pkgs.zsh;
	};

	# Home Manager
	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			"garrett" = import ../home-manager/home.nix;
		};
	};

	# Fonts
	fonts = {
		packages = with pkgs; [
			fira-code
			fira-code-symbols
			nerdfonts
			vistafonts
		];
		fontconfig = {
			defaultFonts = {
				monospace = [ "Fira Code" ];
			};
		};
	};

	# Programs
	programs = {
		ssh.startAgent = true;
		zsh.enable = true;
		direnv.enable = true;
		java.enable = true;
		hyprland = {
			enable = true;
			xwayland.enable = true;
		};
	};

	# Syncthing
	services.syncthing = {
		enable = true;
		user = "garrett";
		group = "users";
		configDir = "/home/garrett/.config/syncthing/";
		dataDir = "/home/garrett/Documents/Synced Files";
	};

	# Open ports in the firewall
	networking.firewall.allowedTCPPorts = [ 8384 22000 ];
	networking.firewall.allowedUDPPorts = [ 22000 21027 ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# Overlays
	# TODO: Move these to the overlays directory
	# nixpkgs.overlays = [
	# 	(final: prev: {
	# 		postman = prev.postman.overrideAttrs(old: rec {
	# 			version = "20230716100528";
	# 			src = final.fetchurl {
	# 				url = "https://web.archive.org/web/${version}/https://dl.pstmn.io/download/latest/linux_64";
	# 				sha256 = "sha256-svk60K4pZh0qRdx9+5OUTu0xgGXMhqvQTGTcmqBOMq8=";

	# 				name = "${old.pname}-${version}.tar.gz";
	# 			};
	# 		});
	# 	})
	# ];

	# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	system.stateVersion = "23.11";
}
