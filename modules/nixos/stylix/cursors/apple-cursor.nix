{ pkgs, ... }: {
	stylix.cursor = {
		package = pkgs.apple-cursor;
		name = "macOS";
		size = 20;
	};
}
