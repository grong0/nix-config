{ config, ... }: {
	programs.alacritty = {
		enable = true;
		settings = {
			# font = {
			# 	size = 14;
			# 	normal = {
			# 		family = "JetBrainsMono Nerd Font";
			# 		style = "Regular";
			# 	};
			# };
			window.padding = {
				x = 12;
				y = 12;
			};
			# colors = {
			# 	primary = {
			# 		background = "#${config.colorScheme.palette.base00}";
			# 		foreground = "#${config.colorScheme.palette.base05}";
			# 	};
			# 	normal = {
			# 		black   = "#${config.colorScheme.palette.base01}";
			# 		red     = "#${config.colorScheme.palette.base08}";
			# 		green   = "#${config.colorScheme.palette.base0B}";
			# 		yellow  = "#${config.colorScheme.palette.base0A}";
			# 		blue    = "#${config.colorScheme.palette.base0D}";
			# 		magenta = "#${config.colorScheme.palette.base0E}";
			# 		cyan    = "#${config.colorScheme.palette.base0C}";
			# 		white   = "#${config.colorScheme.palette.base06}";
			# 	};
			# 	bright = {
			# 		black   = "#${config.colorScheme.palette.base02}";
			# 		red     = "#${config.colorScheme.palette.base08}";
			# 		green   = "#${config.colorScheme.palette.base0B}";
			# 		yellow  = "#${config.colorScheme.palette.base0A}";
			# 		blue    = "#${config.colorScheme.palette.base0D}";
			# 		magenta = "#${config.colorScheme.palette.base0E}";
			# 		cyan    = "#${config.colorScheme.palette.base0C}";
			# 		white   = "#${config.colorScheme.palette.base07}";
			# 	};
			# };
		};
	};
}
