{ pkgs, ... }: {
	stylix = {
		base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-lakeside-light.yaml";
		image = ./stalenhag-2-54.jpg;
		polarity = "light";

		fonts = {
			monospace = {
				# package = pkgs.nerd-fonts.jetbrains-mono;
				package = pkgs.nerd-fonts.jetbrains-mono;
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
