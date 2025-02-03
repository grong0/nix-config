{ pkgs, config, ... }:
{
	gtk = {
		enable = true;
		theme = {
			name = "Orchis-Yellow-Dark";
			package = pkgs.orchis-theme;
		};
		iconTheme = {
			name = "Tela-black";
			package = pkgs.tela-icon-theme;
		};
		# gtk3.extraConfig = {
		# 	Settings = ''
		# 		gtk-application-prefer-dark-theme=1
		# 	'';
		# };
		# gtk4.extraConfig = {
		# 	Settings = ''
		# 		gtk-application-prefer-dark-theme=1
		# 	'';
		# };
	};
	xdg.configFile = {
		"gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
		"gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
		"gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
	};
	home.sessionVariables.GTK_THEME = "Orchis-Yellow-Dark";
}
