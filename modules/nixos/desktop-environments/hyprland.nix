{ ... }: {
	services.displayManager.sddm = {
		enable = true;
	# 	wayland = true;
	};
	programs.hyprland = {
		enable = true;
		# xwayland.enable = true;
	};
}
