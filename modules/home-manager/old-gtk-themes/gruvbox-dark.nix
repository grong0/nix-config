{ pkgs, ... }:

{
	gtk = {
		enable = true;
		theme = {
			name = "gruvbox-dark";
			package = pkgs.gruvbox-dark-gtk;
		};
		iconTheme = {
			name = "gnome";
			package = pkgs.gruvbox-dark-icons-gtk;
		};
	};
}
