{ pkgs, ... }: {
	stylix = {
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
		image = ./flowers.jpg;
		polarity = "dark";

		fonts = {
			monospace = {
				# package = pkgs.nerd-fonts.jetbrains-mono;
				package = pkgs.nerdfonts;
				name = "JetBrainsMono Nerd Font";
			};
			sansSerif = {
				package = pkgs.ubuntu_font_family;
				name = "Ubuntu";
			};
			serif = {
				package = pkgs.arkpandora_ttf;
				name = "Tymes";
			};
		};
	};

	imports = [
		../../cursors/apple-cursor.nix
	];
}
