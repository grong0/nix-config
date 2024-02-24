#r Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			inputs.home-manager.nixosModules.default
		];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	swapDevices = [ {
		device = "/var/lib/swapfile";
		size = 16*1024;
	} ];

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
	# services.xserver.desktopManager.gnome.enable = true;
	services.xserver.displayManager.gdm.wayland = true;

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
	services.xserver.xkb = {
		layout = "us";
		variant = "";
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

	users.users.garrett = {
		isNormalUser = true;
		description = "Garrett Tupper";
		extraGroups = [ "networkmanager" "wheel" "docker" ];
		shell = pkgs.zsh;
	};

	# Enable touchpad support (enabled default in most desktopManager).
	services.xserver.libinput.enable = true;

	# Enable Thumb drives
	services.gvfs.enable = true;
	services.udisks2.enable = true;

	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			"garrett" = {
				# Home Manager needs a bit of information about you and the paths it should
				# manage.
				home.username = "garrett";
				home.homeDirectory = "/home/garrett";

				# This value determines the Home Manager release that your configuration is
				# compatible with. This helps avoid breakage when a new Home Manager release
				# introduces backwards incompatible changes.
				#
				# You should not change this value, even if you update Home Manager. If you do
				# want to update the value, then make sure to first check the Home Manager
				# release notes.
				home.stateVersion = "23.11"; # Please read the comment before changing.

				# The home.packages option allows you to install Nix packages into your
				# environment.
				home.packages = with pkgs; [
					# # Adds the 'hello' command to your environment. It prints a friendly
					# # "Hello, world!" when run.
					# pkgs.hello

					# # It is sometimes useful to fine-tune packages, for example, by applying
					# # overrides. You can do that directly here, just don't forget the
					# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
					# # fonts?
					# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

					# # You can also create simple shell scripts directly inside your
					# # configuration. For example, this adds a command 'my-hello' to your
					# # environment:
					# (pkgs.writeShellScriptBin "my-hello" ''
					#   echo "Hello, ${config.home.username}!"
					# '')
					zsh
					oh-my-zsh
					kitty
					firefox
					vscode-fhs
					dolphin
					python3
					mypy
					syncthing
					discord
					hyprland
					hyprpaper
					waybar
					mattermost-desktop
					rofi-wayland
					keepassxc
					neofetch
					docker
					git
					slack
					dbeaver
					nodejs_21
					openssl
					gccgo
					gnumake
					zulu
					maven
					postman
					unzip
					rustup
					eza
					monitor
					upower
					fd
					zoxide
					calc
					grim
					swappy
					slurp
					neovim
					ripgrep
					fzf
					gitui
					gdb
					gnome.nautilus
					usbutils
					udiskie
					udisks
				];

				# Home Manager is pretty good at managing dotfiles. The primary way to manage
				# plain files is through 'home.file'.
				home.file = {
					# # Building this configuration will create a copy of 'dotfiles/screenrc' in
					# # the Nix store. Activating the configuration will then make '~/.screenrc' a
					# # symlink to the Nix store copy.
					# ".screenrc".source = dotfiles/screenrc;

					# # You can also set the file content immediately.
					# ".gradle/gradle.properties".text = ''
					#   org.gradle.console=verbose
					#   org.gradle.daemon.idletimeout=3600000
					# '';
				};

				# Home Manager can also manage your environment variables through
				# 'home.sessionVariables'. If you don't want to manage your shell through Home
				# Manager then you have to manually source 'hm-session-vars.sh' located at
				# either
				#
				#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
				#
				# or
				#
				#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
				#
				# or
				#
				#  /etc/profiles/per-user/garrett/etc/profile.d/hm-session-vars.sh
				#
				home.sessionVariables = {
					# EDITOR = "emacs";
				};

				# Let Home Manager install and manage itself.
				programs.home-manager.enable = true;

				programs.git = {
					enable = true;
					userName = "grong0";
					userEmail = "garrett59100@gmail.com";
				};

				gtk = {
					enable = true;
					theme = {
						name = "Nordic";
						package = pkgs.nordic;
					};
					cursorTheme = {
						name = "apple_cursor";
						package = pkgs.apple-cursor;
						size = 24;
					};
					iconTheme = {
						name = "gnome-icon-theme";
						package = pkgs.gnome-icon-theme;
					};
				};
			};
		};
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
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

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
