# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
	inputs,
	outputs,
	config,
	pkgs,
	...
}: {
	# You can import other home-manager modules here
	imports = [
		# If you want to use modules your own flake exports (from modules/home-manager):
		outputs.homeManagerModules.gtk-theme
		outputs.homeManagerModules.cursor-theme

		# Or modules exported from other flakes (such as nix-colors):
		inputs.nix-colors.homeManagerModules.default

		# You can also split up your configuration and import pieces of it here:
		# ./nvim.nix
	];

	nixpkgs = {
		# You can add overlays here
		overlays = [
			# Add overlays your own flake exports (from overlays and pkgs dir):
			# outputs.overlays.additions
			# outputs.overlays.modifications
			outputs.overlays.unstable-packages
			# outputs.overlays.nix-ros-overlay

			# You can also add overlays exported from other flakes:
			# neovim-nightly-overlay.overlays.default

			# Or define it inline, for example:
			# (final: prev: {
			#   hi = final.hello.overrideAttrs (oldAttrs: {
			#     patches = [ ./change-hello-to-hi.patch ];
			#   });
			# })
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
		# Configure your nixpkgs instance
		config = {
			# Disable if you don't want unfree packages
			allowUnfree = true;
			# Workaround for https://github.com/nix-community/home-manager/issues/2942
			allowUnfreePredicate = _: true;
		};
	};

	home = {
		username = "garrett";
		homeDirectory = "/home/garrett";

		# The home.packages option allows you to install Nix packages into your
		# environment.
		packages = with pkgs; [
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
			nanorc
			# unstable.alacritty
			firefox
			vscode-fhs
			xfce.thunar
			gnome.nautilus
			python3
			mypy
			syncthing
			(pkgs.discord.override {
				# withOpenASAR = true;
				withVencord = true;
			})
			webcord-vencord
			hyprpaper
			waybar
			mattermost-desktop
			rofi-wayland
			keepassxc
			neofetch
			nitch
			docker
			git
			slack
			nodejs_22
			openssl
			gccgo
			gnumake
			jdk21
			maven
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
			usbutils
			udiskie
			udisks
			unstable.arduino-ide
			arduino-cli
			appimagekit
			brightnessctl
			pamixer
			jq
			btop
			unstable.postman
			obsidian
			valgrind
			sonar-scanner-cli
			imv
			gimp
			poetry
			libreoffice
			steam
			powertop
			dnsmasq
			wine
			teensy-loader-cli
			libsForQt5.bismuth
			cargo-tauri
			waydroid
			tailwindcss
			gparted
			pgadmin4
			screen
			unstable.multipass
			p7zip
			notepadqq
			distrobox
			mako
			google-fonts
			godot_4
			inkscape
			pavucontrol
		];

		# Home Manager is pretty good at managing dotfiles. The primary way to manage
		# plain files is through 'home.file'.
		file = {
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
		sessionVariables = {
			# NODE_HOME = "${pkgs.nodejs_21}";
		};

		# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
		stateVersion = "24.05";
	};

	programs.alacritty = {
		enable = true;
		settings = {
			font = {
				size = 18;
				normal = {
					family = "JetBrainsMono Nerd Font";
					style = "Regular";
				};
			};

			window.padding = {
				x = 12;
				y = 12;
			};

			colors = {
				primary = {
					background = "#${config.colorScheme.palette.base00}";
					foreground = "#${config.colorScheme.palette.base05}";
				};
				normal = {
					black   = "#${config.colorScheme.palette.base01}";
					red     = "#${config.colorScheme.palette.base08}";
					green   = "#${config.colorScheme.palette.base0B}";
					yellow  = "#${config.colorScheme.palette.base0A}";
					blue    = "#${config.colorScheme.palette.base0D}";
					magenta = "#${config.colorScheme.palette.base0E}";
					cyan    = "#${config.colorScheme.palette.base0C}";
					white   = "#${config.colorScheme.palette.base06}";
				};
				bright = {
					black   = "#${config.colorScheme.palette.base02}";
					red     = "#${config.colorScheme.palette.base08}";
					green   = "#${config.colorScheme.palette.base0B}";
					yellow  = "#${config.colorScheme.palette.base0A}";
					blue    = "#${config.colorScheme.palette.base0D}";
					magenta = "#${config.colorScheme.palette.base0E}";
					cyan    = "#${config.colorScheme.palette.base0C}";
					white   = "#${config.colorScheme.palette.base07}";
				};
			};
		};
	};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;

	# Currently Doesn't do Anything
	programs.autorandr = {
		enable = true;
		profiles = {
			"desktop" = {
				fingerprint = {
					"AOPEN" = "DP-0";
					"Samsung" = "DP-1";
					"HP" = "HDMI-0";
				};
				config = {
					Samsung = {
						enable = true;
						primary = false;
						position = "-1920x0";
						mode = "1920x1080";
						rate = "60.00";
						rotate = "normal";
					};
					AOPEN= {
						enable = true;
						primary = true;
						position = "0x0";
						mode = "1920x1080";
						rate = "164.92";
						rotate = "normal";
					};
					HP = {
						enable = true;
						primary = false;
						position = "1920x0";
						mode = "1920x1080";
						rate = "60.00";
						rotate = "normal";
					};
				};
			};
		};
	};

	programs.git = {
		enable = true;
		userName = "grong0";
		userEmail = "garrett59100@gmail.com";
	};

	nixpkgs.config.permittedInsecurePackages = [
		"electron-25.9.0"
	];

	# Add stuff for your user as you see fit:
	# programs.neovim.enable = true;
	# home.packages = with pkgs; [ steam ];

	# Nicely reload system units when changing configs
	systemd.user.startServices = "sd-switch";
}
