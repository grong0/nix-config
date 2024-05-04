{ pkgs, ... }:

{
	home.pointerCursor = {
		package = pkgs.apple-cursor;
		name = "macOS-BigSur";
		size = 20;
		gtk.enable = true;
	};
}
