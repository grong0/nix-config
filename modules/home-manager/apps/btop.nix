{ pkgs, ... }: {
	programs.btop = {
		enable = true;
		package = pkgs.unstable.btop;
		settings = {
			shown_boxes = "cpu mem net proc gpu0";
			update_ms = 1000;
		};
	};
}
