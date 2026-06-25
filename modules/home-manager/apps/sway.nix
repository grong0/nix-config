{ lib, ... }:
let
	mod = "Mod4";
in
{
	wayland.windowManager.sway = {
		enable = true;
		wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
		
		extraOptions = [ "--unsupported-gpu" ];

		config = {
			modifier = mod;
			terminal = "alacritty";
			startup = [
				# Launch Firefox on start
				{command = "xrandr --output DP-1 --primary";}
				{command = "waybar";}
				{command = "xinput set-prop 12 324 0";}
				{command = "xinput set-prop 12 322 40";}
				{command = "sudo chmod u+w /sys/firmware/acpi/platform_profile";}
				# {command = "syncthing";}
				{command = "udiskie -atv";}
				{command = "lxqt-policykit-agent";}
				{command = "mako";}
			];

			keybindings = lib.attrsets.mergeAttrsList [
				(lib.attrsets.mergeAttrsList (map (num: let
					ws = toString num;
				in {
					# Switch workspace
					"${mod}+${ws}" = "workspace ${ws}";
					# Move active window to workspace
					"${mod}+Shift+${ws}" = "move container to workspace ${ws}";
				}) [1 2 3 4 5 6 7 8 9 0]))

				{
					# Move focus
					"${mod}+left" = "focus left";
					"${mod}+right" = "focus right";
					"${mod}+up" = "focus up";
					"${mod}+down" = "focus down";

					# Function Keys
					# Backlight Control
					"XF86MonBrightnessUp" = "brightnessctl set +5%";
					"XF86MonBrightnessDown" = "brightnessctl set 5%-";
					# Volume Control
					"XF86AudioRaiseVolume" = "exec pamixer -i 5";
					"XF86AudioLowerVolume" = "exec pamixer -d 5";
					# Gradular Volume Control
					"${mod}+XF86AudioRaiseVolume" = "exec pamixer -i 1";
					"${mod}+XF86AudioLowerVolume" = "exec pamixer -d 1";
					# Mute
					"XF86AudioMute" = "exec pamixer -t";
					# Mic Mute Toggle
					"XF86AudioMicMute" = "exec amixer sset Capture toggle";
					# Audio Control
					"XF86AudioPlay" = "playerctl play";
					"XF86AudioPause" = "playerctl pause";
					"XF86AudioNext" = "playerctl next";
					"XF86AudioPrev" = "playerctl previous";
					# Screenshot
					"Print" = "grim -g \"$(slurp)\" - | swappy -f -";

					# Open Applications
					"${mod}+Return" = "alacritty";
					"${mod}+e" = "nautilus -w";
					"${mod}+d" = "rofi -show-icons -show drun";

					# Manage Windows
					"${mod}+q" = "killactive";
					"${mod}+m" = "exit";
					"${mod}+v" = "togglefloating";
					"${mod}+p" = "pseudo"; # dwindle
					"${mod}+j" = "togglesplit"; # dwindle
					"${mod}+f" = "fullscreen";
				}
			];
		};
	};
}
