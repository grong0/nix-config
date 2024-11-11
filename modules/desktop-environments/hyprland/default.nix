{...}:
{
	services.xserver = {
		enable = true;
		displayManager.sddm = {
			enable = true;
			# wayland = true;
		};
		windowManager.hypr.enable = true;
	};
	programs.hyprland = {
		enable = true;
		# xwayland.enable = true;
	};
}
