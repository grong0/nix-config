{ pkgs, config, inputs, ... }:
{
	gtk = {
		enable = true;
		theme = {
			name = "catppuccin-frappe-blue-standard";
			package = pkgs.catppuccin-gtk;
		};
		iconTheme = {
			name = "Tela-nord-dark";
			package = pkgs.tela-icon-theme;
		};
	};
	colorScheme = inputs.nix-colors.colorSchemes.catppuccin-frappe;
	xdg.configFile = {
		"gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
		"gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
		"gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
	};
	home.sessionVariables.GTK_THEME = "catppuccin-frappe-blue-standard";
}
