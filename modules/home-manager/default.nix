# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
# List your module files here
# my-module = import ./my-module.nix;
{
	gtk-theme = import ./themes/gruvbox-dark.nix;
	cursor-theme = import ./themes/apple-cursor.nix;
}
