{ pkgs, config, inputs, ... }:
{
	gtk = {
		enable = true;
		theme = {
			name = "Ayu-Dark";
			package = pkgs.ayu-theme-gtk;
		};
		iconTheme = {
			name = "Tela-orange";
			package = pkgs.tela-icon-theme;
		};
	};
	colorScheme = inputs.nix-colors.colorSchemes.ayu-dark;
	services.hyprpaper.settings.preload = [ "/home/garrett/Pictures/Backgrounds/exorcist-wallpapers/leaf.jpg" ];
	services.hyprpaper.settings.wallpaper = [ ",/home/garrett/Pictures/Backgrounds/exorcist-wallpapers/leaf.jpg" ];
	xdg.configFile = {
		"gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
		"gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
		"gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
	};
	home.sessionVariables.GTK_THEME = "Ayu-Dark";
}
