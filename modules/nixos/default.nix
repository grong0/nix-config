# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
# List your module files here
# my-module = import ./my-module.nix;
{
	hyprland = import ./desktop-environments/hyprland.nix;
	i3 = import ./desktop-environments/i3.nix;
	sway = import ./desktop-environments/sway.nix;
	# kde = import ./desktop-environments/kde.nix;

	stylix = import ./stylix/default.nix;
}
