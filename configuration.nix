# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
			#<nixos-hardware/microsoft/surface/surface-laptop-amd>
			#<nixpkgs/nixos/modules/virtualization/qemu-vm.nix>
		];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.kernelParams = [ "amd_iommu=off" "iommu=off" ];

	networking.hostName = "Garretts-Laptop"; # Define your hostname.
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "America/New_York";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
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

	# Enable the X11 windowing system.
	services.xserver.enable = true;

	# Enable the GNOME Desktop Environment.
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;

	# xdg = {
	#   autostart.enable = true;
	#   portal = {
	#     enable = true;
	#     extraPortals = [
	#       pkgs.xdg-desktop-portal
	#       pkgs.xdg-desktop-portal-gtk
	#     ];
	#   };
	# };

	# Configure keymap in X11
	services.xserver = {
		layout = "us";
		xkbVariant = "";
	};

	# Enable CUPS to print documents.
	services.printing.enable = true;

	# Enable sound with pipewire.
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

	# Enable touchpad support (enabled default in most desktopManager).
	services.xserver.libinput.enable = true;

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.garrett = {
		isNormalUser = true;
		description = "Garrett Tupper";
		extraGroups = [ "networkmanager" "wheel" "docker" ];
		shell = pkgs.zsh;
		packages = with pkgs; [
			zsh
			oh-my-zsh
			alacritty
			vscode-fhs
			python3
			syncthing
			discord
			appflowy
			hyprland
			waybar
			mattermost-desktop
			rofi-wayland
			keepassxc
			neofetch
			docker
			docker-client
			kitty
			git
			slack
			dbeaver
			nodejs_21
			openssl
			gccgo
			binutils
			gnumake
			zulu
			zulu8
			maven
			postman
			unzip
		];
	};

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

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
	#  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	#  wget
	];

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	#  programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };
	programs.ssh.startAgent = true;
	programs.zsh.enable = true;
	programs.direnv.enable = true;
	programs.java.enable = true;
	# programs.hyprland = {
	# 	enable = true;
	# 	xwayland.enable = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	services.openssh.enable = true;
	virtualisation.docker.enable = true;

	# Syncthing
	services.syncthing = {
		enable = true;
		user = "garrett";
		group = "users";
		configDir = "/home/garrett/.config/syncthing/";
		dataDir = "/home/garrett/Documents/Synced Files";
	};

	# Open ports in the firewall.
	networking.firewall.allowedTCPPorts = [ 8384 22000 ];
	networking.firewall.allowedUDPPorts = [ 22000 21027 ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

  nixpkgs.overlays = [
    (final: prev: {
      postman = prev.postman.overrideAttrs(old: rec {
        version = "20230716100528";
        src = final.fetchurl {
          url = "https://web.archive.org/web/${version}/https://dl.pstmn.io/download/latest/linux_64";
          sha256 = "sha256-svk60K4pZh0qRdx9+5OUTu0xgGXMhqvQTGTcmqBOMq8=";

          name = "${old.pname}-${version}.tar.gz";
        };
      });
    })
  ];



	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "23.11"; # Did you read the comment?
}
