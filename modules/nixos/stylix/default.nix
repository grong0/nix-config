{ pkgs, ... }: {
	imports = [
		./themes/catppuccin-frappe/default.nix
	];

	stylix = {
		enable = true;
		autoEnable = true;
		homeManagerIntegration = {
			autoImport = true;
			followSystem = true;
		};
		fonts = {
			emoji = {
				package = pkgs.twemoji-color-font;
				name = "tewmoji-color-font";
			};
			sizes = {
				applications = 12;
				desktop = 16;
				popups = 12;
				terminal = 14;
			};
		};
		targets = {
			gnome.enable = true;
			gtk.enable = true;
			grub.useImage = true;
		};
	};

	home-manager.users.garrett.stylix = {
		enable = true;
		targets = {
			waybar = {
				enableCenterBackColors = false;
				enableLeftBackColors = false;
				enableRightBackColors = false;
			};
			btop.enable = true;
		};
	};
}
