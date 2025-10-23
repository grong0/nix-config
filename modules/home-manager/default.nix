# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
# List your module files here
# my-module = import ./my-module.nix;
{
	apps = {
		alacritty = import ./apps/alacritty.nix;
		hyprland = import ./apps/hyprland.nix;
		hyprpaper = import ./apps/hyprpaper.nix;
		waybar = import ./apps/waybar.nix;
		vesktop = import ./apps/vesktop.nix;
		mako = import ./apps/mako.nix;
		vscode = import ./apps/vscode.nix;
		zed-editor = import ./apps/zed-editor.nix;
		chadwm = import ./apps/chadwm.nix;
		eww = import ./apps/eww.nix;
		btop = import ./apps/btop.nix;
		neovim = import ./apps/neovim.nix;
		webcord = import ./apps/webcord.nix;
		rofi = import ./apps/rofi.nix;
		obsidian = import ./apps/obsidian.nix;
	};
}
