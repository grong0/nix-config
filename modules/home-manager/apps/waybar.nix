{ pkgs, config, lib, ... }: {
	home.packages = with pkgs; [ python311Packages.pyquery ];
	programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
				layer = "top";
				position = "top";
				mode = "dock";
				exclusive = true;
				passthrough = false;
				gtk-layer-shell = true;
				height = 30;
				modules-left = [
					"hyprland/workspaces"
					"hyprland/window"
				];
				modules-center = [
					# "custom/bar-gmail"
					"clock"
					"custom/weather"
				];
				modules-right = [
					"network"
					"cpu"
					"temperature"
					"custom/power_profile"
					"battery"
					"backlight"
					"pulseaudio"
					"pulseaudio#microphone"
					"tray"
				];

				"hyprland/window" = {
					format = "{}";
				};

				"wlr/workspaces" = {
					disable-scroll = true;
					all-outputs = true;
					on-click = "activate";
					persistent_workspaces = {
						"1" = [];
						"2" = [];
						"3" = [];
						"4" = [];
						"5" = [];
						"6" = [];
						"7" = [];
						"8" = [];
						"9" = [];
						"10" = [];
					};
				};

				"custom/power_profile" = {
					# shows the current power profile and switches to next on click
					exec = "surface profile get | sed s:'Active profile is'::";
					interval = 30;
					format = "󰈐  {}";
					on-click = "surface profile list; pkill -SIGRTMIN+8 waybar";
					signal = 8;
				};

				# "custom/weather" = {
				#     # shows the current weather and forecast
				#     tooltip = true;
				#     format = "{}";
				#     interval = 30;
				#     exec = "~/.config/waybar/scripts/waybar-wttr.py";
				#     return-type = "json";
				# };

				"custom/weather" = {
					exec = "python ~/.config/waybar/scripts/weather/weather.py";
					restart-interval = 300;
					return-type = "json";
					on-click = "xdg-open https://weather.com/en-IN/weather/today/l/$(location_id)";
					# format-alt = "{alt};
				};

				"custom/bar-gmail" = {
					exec = "python ~/Coding\\ Programs/Google\\ Auth/quickstart.py";
					# exec = "bar-gmail -f waybar";
					tooltip = false;
					interval = 10;
					return-type = "json";
					on-click = "xdg-open https://mail.google.com/mail/u/0/#inbox";
				};

				tray = {
					icon-size = 15;
					spacing = 5;
				};

				clock = {
					format = "  {:%I:%M %p     %a %b %e}";
					tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
				};

				backlight = {
					device = "intel_backlight";
					format = "{icon}  {percent}%";
					format-icons = ["󰃞" "󰃟" "󰃠"];
					on-scroll-up = "brightnessctl set 1%+";
					on-scroll-down = "brightnessctl set 1%-";
					min-length = 6;
				};

				battery = {
					states = {
						good = 95;
						warning = 30;
						critical = 20;
					};
					format = "{icon}  {capacity}%";
					format-charging = "  {capacity}%";
					format-plugged = "  {capacity}%";
					format-alt = "{time}  {icon}";
					format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
				};

				pulseaudio ={
					format = "{icon}  {volume}%";
					tooltip = false;
					format-muted = " Muted";
					on-click = "pamixer -t";
					on-scroll-up = "pamixer -i 5";
					on-scroll-down ="pamixer -d 5";
					scroll-step =5;
					format-icons = {
						headphone = "";
						handsfree = "";
						headset = "";
						phone = "";
						portable = "";
						car = "";
						default = ["" "" ""];
					};
				};

				"pulseaudio#microphone" = {
					format = "{format_source}";
					format-source = "Mic {volume}%";
					format-source-muted = "Mic Muted";
					on-click = "pamixer --default-source -t";
					on-scroll-up = "pamixer --default-source -i 5";
					on-scroll-down = "pamixer --default-source -d 5";
					scroll-step = 5;
				};

				# temperature = {
				# 	thermal-zone = 1;
				# 	format = "{temperatureF}°F ";
				# 	critical-threshold = 80;
				# 	format-critical = "{temperatureC}°C ";
				# };

				network = {
					# interface = "wlp2*" # (Optional) To force the use of this interface
					format-wifi ="   {signalStrength}%";
					format-ethernet ="{ipaddr}/{cidr} 󰈀 ";
					tooltip-format ="{essid} - {ifname} via {gwaddr} 󰈀 ";
					format-linked ="{ifname} (No IP)  ";
					format-disconnected ="Disconnected ⚠";
					format-alt ="{ifname}:{essid} {ipaddr}/{cidr}";
				};

				bluetooth = {
					format =" {status}";
					format-disabled = ""; # an empty format will hide the module
					format-connected = " {num_connections}";
					tooltip-format = "{device_alias}";
					tooltip-format-connected = " {device_enumerate}";
					tooltip-format-enumerate-connected = "{device_alias}";
				};

				cpu = {
					interval = 1;
					format = "{avg_frequency} GHz ";
					# "max-length" = 10;
				};
			};
		};
		style = ''
			* {
				border: none;
				border-radius: 0px;
				font-family: "JetBrainsMono Nerd Font";
				font-weight: bold;
				font-size: 12px;
				min-height: 0;
				transition: 0.3s;
			}

			window#waybar {
				background: rgba(0, 0, 0, 0);
				color: ${config.lib.stylix.colors.withHashtag.base06};
			}

			tooltip {
				background: ${config.lib.stylix.colors.withHashtag.base03};
				border-radius: 10px;
				border-width: 2px;
				border-style: solid;
				border-color: ${config.lib.stylix.colors.withHashtag.base01};
				transition: 0.3s;
			}

			#workspaces button {
				padding: 5px;
				color: ${config.lib.stylix.colors.withHashtag.base05};
				margin-right: 5px;
			}

			#workspaces button.active {
				color: ${config.lib.stylix.colors.withHashtag.base06};
			}

			#workspaces button.focused {
				color: ${config.lib.stylix.colors.withHashtag.base05};
				background: ${config.lib.stylix.colors.withHashtag.base08};
				border-radius: 20px;
			}

			#workspaces button.urgent {
				color: ${config.lib.stylix.colors.withHashtag.base01};
				background: ${config.lib.stylix.colors.withHashtag.base0D};
				border-radius: 20px;
			}

			#workspaces button:hover {
				background: ${config.lib.stylix.colors.withHashtag.base00};
				color: ${config.lib.stylix.colors.withHashtag.base05};
				border-radius: 20px;
			}

			#cpu,
			#custom-power_profile,
			#custom-weather,
			#custom-bar-gmail,
			#window,
			#clock,
			#battery,
			#pulseaudio,
			#pulseaudio.microphone,
			#network,
			#bluetooth,
			#temperature,
			#workspaces,
			#tray,
			#backlight {
				background: ${config.lib.stylix.colors.withHashtag.base00};
				opacity: 0.8;
				padding: 3px 10px;
				margin: 0;
				margin-top: 10px;
				border: 2px solid ${config.lib.stylix.colors.withHashtag.base03};
			}

			#cpu {
				border-radius: 20px 0px 0px 20px;
				border-right: 0px;
			}

			#temperature {
				border-left: 0px;
				border-right: 0px;
			}

			#temperature.critical {
				color: ${config.lib.stylix.colors.withHashtag.base08};
			}

			#backlight {
				border-radius: 20px 0px 0px 20px;
				border-right: 0px;
				padding-left: 7px;
			}

			#tray {
				border-radius: 20px;
				margin-right: 10px;
				padding: 0px 4px 0px 4px;
			}

			#workspaces {
				/* background: #1e1e2e; */
				border-radius: 20px;
				margin-left: 10px;
				padding-right: 0px;
				padding-left: 5px;
			}

			#custom-power_profile {
				color: ${config.lib.stylix.colors.withHashtag.base0B};
				border-left: 0px;
				border-right: 0px;
			}

			#window {
				border-radius: 20px;
				margin-left: 5px;
				margin-right: 5px;
			}

			#clock {
				color: ${config.lib.stylix.colors.withHashtag.base09};
				border-radius: 20px;
				margin-left: 5px;
				/* border-right: 0px; */
				transition: 0.3s;
				padding-left: 7px;
			}

			#network {
				color: ${config.lib.stylix.colors.withHashtag.base0A};
				border-radius: 20px;
				margin-right: 5px;
			}

			#bluetooth {
				color: ${config.lib.stylix.colors.withHashtag.base0D};
				border-radius: 20px;
				margin-right: 10px;
			}

			#pulseaudio {
				color: ${config.lib.stylix.colors.withHashtag.base0D};
				border-left: 0px;
				border-right: 0px;
			}

			#pulseaudio.microphone {
				color: ${config.lib.stylix.colors.withHashtag.base08};
				border-radius: 0px 20px 20px 0px;
				border-left: 0px;
				margin-right: 5px;
				padding-right: 8px;
			}

			#battery {
				color: ${config.lib.stylix.colors.withHashtag.base0B};
				border-radius: 0 20px 20px 0;
				margin-right: 5px;
				border-left: 0px;
			}

			#custom-weather,
			#custom-bar-gmail {
				border-radius: 20px;
				border-right: 0px;
				margin-left: 5px;
			}


			/* Custom Weather Module */
			#custom-weather.severe {
				color: ${config.lib.stylix.colors.withHashtag.base08};
			}

			#custom-weather.sunnyDay {
				color: ${config.lib.stylix.colors.withHashtag.base0B};
			}

			#custom-weather.clearNight {
				color: ${config.lib.stylix.colors.withHashtag.base0E};
			}

			#custom-weather.cloudyFoggyDay, #custom-weather.cloudyFoggyNight {
				color: ${config.lib.stylix.colors.withHashtag.base0D};
			}

			#custom-weather.rainyDay, #custom-weather.rainyNight {
				color: ${config.lib.stylix.colors.withHashtag.base0D};
			}

			#custom-weather.showyIcyDay, #custom-weather.snowyIcyNight {
				color: ${config.lib.stylix.colors.withHashtag.base0C};
			}

			#custom-weather.default {
				color: ${config.lib.stylix.colors.withHashtag.base06};
			}

			/* Custom Gmail Module */
			#custom-bar-gmail.unread {
				color: ${config.lib.stylix.colors.withHashtag.base06};
			}
			#custom-bar-gmail.inaccurate {
				color: ${config.lib.stylix.colors.withHashtag.base09};
			}
			#custom-bar-gmail.error {
				color: ${config.lib.stylix.colors.withHashtag.base08};
			}
		'';
	};
}
