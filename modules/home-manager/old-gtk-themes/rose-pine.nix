{ pkgs, config, inputs, ... }:
{
	gtk = {
		enable = true;
		theme = {
			name = "rose-pine";
			package = pkgs.rose-pine-gtk-theme;
		};
		iconTheme = {
			name = "rose-pine";
			package = pkgs.rose-pine-icon-theme;
		};
	};
	colorScheme = inputs.nix-colors.colorSchemes.rose-pine;
	xdg.configFile = {
		"gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
		"gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
		"gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
	};
	home.sessionVariables.GTK_THEME = "rose-pine";
}
