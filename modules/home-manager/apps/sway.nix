{ pkgs, ... }: {
	wayland.windowManager.sway = {
		enable = true;
		wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
		config = rec {
			modifier = "Mod4";
			terminal = "alacritty";
			startup = [
				# Launch Firefox on start
				{command = "waybar";}
				{command = "xinput set-prop 12 324 0";}
				{command = "xinput set-prop 12 322 40";}
				{command = "sudo chmod u+w /sys/firmware/acpi/platform_profile";}
				{command = "syncthing";}
				{command = "udiskie -atv";}
				{command = "lxqt-policykit-agent";}
				{command = "mako";}
			];
		};
	};
}
