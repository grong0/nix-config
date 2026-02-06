{ pkgs, config, ... }:
{
	gtk = {
		enable = true;
		theme = {
			name = "Orchis-Blue-Dark";
			package = pkgs.orchis-theme;
		};
		iconTheme = {
			name = "Tela-black";
			package = pkgs.tela-icon-theme;
		};
	};
	xdg.configFile = {
		"gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
		"gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
		"gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
	};
	home.sessionVariables.GTK_THEME = "Orchis-Dark-Dark";
}
