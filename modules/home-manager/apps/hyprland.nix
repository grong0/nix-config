{ config, ... }: {
	stylix.targets.hyprland.enable = false;
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			monitor = [
				# laptop
				"eDP-1,2496x1664@60, 0x0, 1.3"

				# home-desktop
				"DP-1,1920x1080@80, 0x0, 1.0"
				"HDMI-A-1,1600x900@60, auto, 1.0"

				# extra
				",preferred,auto,1.0"
			];
			xwayland.force_zero_scaling = true;

			exec-once = [
				"waybar"
				"hyprpaper"
				"xinput set-prop 12 324 0"
				"xinput set-prop 12 322 40"
				"sudo chmod u+w /sys/firmware/acpi/platform_profile"
				# "syncthing"
				# "alias ls='exa --icons --git -l --no-user --no-time --no-permissions --no-filesize --group-directories-first'"
				"udiskie -atv"
				"lxqt-policykit-agent"
				"mako"
			];

			# env = [
			# 	"GDK_SCALE,2"
			# 	"XCURSOR_SIZE,20"
			# ];

			input = {
				kb_layout = "us";
				# kb_variant =
				# kb_model =
				# kb_options =
				# kb_rules =
				follow_mouse = 1;
				touchpad = {
					natural_scroll = "yes";
					scroll_factor = 0.4;
					clickfinger_behavior = true;
					tap-to-click = false;
					tap-and-drag = false;
				};
				sensitivity = 0.3;
			};

			general = {
				gaps_in = 5;
				gaps_out = 20;
				border_size = 2;
				# "col.active_border" = "rgb(#${config.stylix.generated.palette.base0D})";
				# "col.inactive_border" = "rgb(#${config.stylix.generated.palette.base01})";
				layout = "dwindle";
				allow_tearing = false;
			};

			decoration = {
				rounding = 10;
				blur = {
					enabled = false;
					size = 3;
					passes = 1;
					ignore_opacity = 1;
				};
				# drop_shadow = false;
				# shadow_range = 4;
				# shadow_render_power = 3;
				# "col.shadow" = "rgba(1a1a1aee)";
			};

			animations = {
				enabled = "no";
				bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
				animation = [
					"windows, 1, 7, myBezier"
					"windowsOut, 1, 7, default, popin 80%"
					"border, 1, 10, default"
					"borderangle, 1, 8, default"
					"fade, 1, 7, default"
					"workspaces, 1, 6, default"
				];
			};

			dwindle = {
				pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
				preserve_split = "yes"; # you probably want this
			};

			misc = {
				force_default_wallpaper = 0;
				vfr = true;
			};

			windowrule = [
				"opacity 0.9, class:^(Code)$"
				"opacity 0.9, class:^(VSCodium)$"
				"opacity 0.9, class:^(dev.zed.Zed)$"
				"opacity 0.9, class:^(kitty)$"
				"opacity 0.9, class:^(sakura)$"
				"opacity 0.9, class:^(Alacritty)$"
				"opacity 0.9, class:^(discord)$"
				"opacity 0.9, class:^(vesktop)$"
				"opacity 0.9, class:^(obsidian)$"
				"float, class:^(imv)$"
			];

			"$mainMod" = "SUPER";
			bind = [
				# Function Keys
				# Backlight Control
				", XF86MonBrightnessUp, exec, brightnessctl set +5%"
				", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
				# Volume Control
				", XF86AudioRaiseVolume, exec, exec pamixer -i 5"
				", XF86AudioLowerVolume, exec, exec pamixer -d 5"
				# Gradular Volume Control
				"$mainMod, XF86AudioRaiseVolume, exec, exec pamixer -i 1"
				"$mainMod, XF86AudioLowerVolume, exec, exec pamixer -d 1"
				# Mute
				", XF86AudioMute, exec, exec pamixer -t"
				# Mic Mute Toggle
				", XF86AudioMicMute, exec, exec amixer sset Capture toggle"
				# Audio Control
				", XF86AudioPlay, exec, playerctl play"
				", XF86AudioPause, exec, playerctl pause"
				", XF86AudioNext, exec, playerctl next"
				", XF86AudioPrev, exec, playerctl previous"
				# Screenshot
				", Print, exec, grim -g \"$(slurp)\" - | swappy -f -"

				# Open Applications
				"$mainMod, Return, exec, alacritty"
				"$mainMod, E, exec, nautilus -w"
				"$mainMod, D, exec, rofi -show-icons -show drun"

				# Manage Windows
				"$mainMod, Q, killactive,"
				"$mainMod, M, exit,"
				"$mainMod, V, togglefloating,"
				"$mainMod, P, pseudo," # dwindle
				"$mainMod, J, togglesplit" # dwindle
				"$mainMod, F, fullscreen,"

				# Move focus with mainMod + arrow keys
				"$mainMod, left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod, up, movefocus, u"
				"$mainMod, down, movefocus, d"

				# Switch workspace with mainMod + [0-9]
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"

				# Move active window to a workspace with mainMod + SHIFT + [0-9]
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"
			];

			bindm = [
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];
		};
	};
}
