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
		overlays = [
		# 	# Add overlays your own flake exports (from overlays and pkgs dir):
		# 	outputs.overlays.additions
		# 	outputs.overlays.modifications
		#	outputs.overlays.unstable-packages

		# 	# You can also add overlays exported from other flakes:
		# 	# neovim-nightly-overlay.overlays.default

		# 	# Or define it inline, for example:
		# 	# (final: prev: {
		# 	#   hi = final.hello.overrideAttrs (oldAttrs: {
		# 	#     patches = [ ./change-hello-to-hi.patch ];
		# 	#   });
		# 	# })
		];
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
		# Enable Cachix for nix-gaming
		substituters = ["https://nix-gaming.cachix.org"];
		trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
	};

	# nix-gaming
	# TODO: MOVE TO HOME-MANAGER
	environment.systemPackages = [
		inputs.nix-gaming.packages.${pkgs.system}.osu-stable
	];

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

	# Bluetooth
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = true;
	services.blueman.enable = true;

	# Services
	services = {
		xserver = {
			enable = true;
			xkb = {
				layout = "us";
				variant = "";
			};
		};
		# Enable touchpad support
		libinput.enable = true;

		# Enable CUPS to print documents
		printing.enable = true;

		# Enable Thumb drives
		devmon.enable = true;
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
		extraGroups = [ "networkmanager" "wheel" "docker" "dialout" "audio" "surface-control" ];
		shell = pkgs.zsh;
	};

	# Home Manager
	home-manager = {
		extraSpecialArgs = { inherit inputs outputs; };
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
		java = {
			enable = true;
			package = pkgs.jdk21;
		};
		steam.enable = true;
	};

	# Syncthing
	services.syncthing = {
		enable = true;
		user = "garrett";
		group = "users";
		configDir = "/home/garrett/.config/syncthing/";
		dataDir = "/home/garrett/Documents/Synced Files";
	};

	# Eventually move to `home.nix`w
	virtualisation.docker.enable = true;
	virtualisation.waydroid.enable = true;
	virtualisation.libvirtd.enable = true;

	programs.nix-ld.enable = true;

	# WireGuard
	networking.firewall = {
		allowedTCPPorts = [ 8384 22000 ];
		allowedUDPPorts = [ 51820 22000 21027 ];
	};
	# networking.wireguard.interfaces = {
	# 	wg0 = {
	# 		ips = [ "10.100.0.2/24" ];
	# 		listenPort = 51820;
	# 		privateKeyFile = "~/.config/keyFiles/HomeServer.conf";
	# 		peers = [{
	# 			publicKey = "ljD65xZ5xib28s1B9gfOJfYHLdLU8rfhtv02p2DuSBk=";
	# 			allowedIPs = [ "192.168.1.0/24" ];
	# 			endpoint = "garrettpc.duckdns.org:51820";
	# 			persistentKeepalive = 25;
	# 		}];
	# 	};
	# };
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# Hyprland
	services.displayManager.sddm = {
		enable = true;
	# 	wayland = true;
	};
	services.xserver.windowManager.hypr.enable = true;
	programs.hyprland = {
		enable = true;
		# xwayland.enable = true;
	};

	# sway
	# programs.sway = {
	# 	enable = true;
	# 	wrapperFeatures.gtk = true;
	# };

	# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	system.stateVersion = "24.05";
}
