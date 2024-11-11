{ pkgs, ... }:

{
    gtk = {
		enable = true;
		theme = {
			name = "Graphite-Dark";
			package = pkgs.graphite-gtk-theme;
		};
		iconTheme = {
			name = "Tela-black";
			package = pkgs.tela-icon-theme;
		};
		gtk3.extraConfig = {
			Settings = ''
				gtk-application-prefer-dark-theme=1
			'';
		};
		gtk4.extraConfig = {
			Settings = ''
				gtk-application-prefer-dark-theme=1
			'';
		};
	};

}
