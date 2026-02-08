{ pkgs, ... }: {
	programs.zsh = {
		enable = true;
		enableCompletion = true;

		autosuggestion.enable = true;

		initContent = ''
			${builtins.readFile ./.p10k.zsh}
			source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme;
			source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh;

			eval "$(zoxide init --cmd cd zsh)"
			bindkey '^H' backward-kill-word
		'';

		oh-my-zsh = {
			enable = true;
			plugins = [
				"git"
				"history"
				"emoji"
				"direnv"
			];
		};

		shellGlobalAliases = {
			ls = "exa --icons -l --no-user --no-time --no-permissions --group-directories-first --color-scale";
			lsa = "exa --icons -l --group-directories-first --color-scale";
			rebuild-laptop = "sudo nixos-rebuild switch --impure --flake ~/.nix-config#laptop";
			rebuild-desktop = "sudo nixos-rebuild switch --impure --flake ~/.nix-config#desktop";
			clea = "clear";
			rls = "ls";
			zed = "zeditor";
			"new-shell" = ''
touch shell.nix & echo "
# https://nix.dev/tutorials/declarative-and-reproducible-developer-environments
with import <nixpkgs> { };
mkShell {
  # Package names can be found via https://search.nixos.org/packages
  nativeBuildInputs = [
    direnv
  ];

  NIX_ENFORCE_PURITY = true;

  shellHook = '''''';
}" > shell.nix
			'';
		};
	};
}
