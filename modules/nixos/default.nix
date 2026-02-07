# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
# List your module files here
# my-module = import ./my-module.nix;
{
	hyprland = import ./desktop-environments/hyprland.nix;
	i3 = import ./desktop-environments/i3.nix;
	# kde = import ./desktop-environments/kde.nix;
	dwm = import ./desktop-environments/dwm.nix;

	stylix = import ./stylix/default.nix;
}
