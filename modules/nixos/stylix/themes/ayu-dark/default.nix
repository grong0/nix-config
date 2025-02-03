{ pkgs, ... }: {
	stylix = {
		base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
		image = ./leaf.jpg;
		polarity = "dark";

		fonts = {
			monospace = {
				package = pkgs.nerdfonts;
				name = "JetBrainsMonoNerdFont";
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
