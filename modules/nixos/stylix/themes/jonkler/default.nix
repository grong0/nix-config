{ pkgs, ... }: {
	stylix = {
		image = ./jonkler.png;
		polarity = "dark";

		fonts = {
			monospace = {
				# package = pkgs.nerd-fonts.jetbrains-mono;
				package = pkgs.nerd-fonts.jetbrains-mono;
				name = "JetBrainsMono Nerd Font";
			};
			sansSerif = {
				package = pkgs.ubuntu-classic;
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
