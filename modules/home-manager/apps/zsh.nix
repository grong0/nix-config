{ pkgs, ... }: {
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		
		autosuggestion.enable = true;
		
		initContent = ''
			eval "$(zoxide init --cmd cd zsh)"
			bindkey '^H' backward-kill-word
		'';
		
		localVariables = ''
			
		'';
		
		oh-my-zsh = {
			enable = true;
			plugins = [
				"git"
				"fast-syntax-highlighting"
				"history"
				"emoji"
				"direnv"
			];
			theme = "powerlevel10k/powerlevel10k";
		};
		
		shellGlobalAliases = {
			ls = "exa --icons -l --no-user --no-time --no-permissions --group-directories-first --color-scale";
			rebuild = "sudo nixos-rebuild switch --impure --flake ~/.nix-config#laptop";
			clea = "clear";
			rls = "ls";
			zed = "zeditor";
			new-nix-shell = ''
touch shell.nix & echo '
# https://nix.dev/tutorials/declarative-and-reproducible-developer-environments
with import <nixpkgs> { };
mkShell {
  # Package names can be found via https://search.nixos.org/packages
  nativeBuildInputs = [
    direnv
  ];

  NIX_ENFORCE_PURITY = true;

  shellHook = ''
  '';
}' > shell.nix
			'';
		};
	};
	
	# for enableCompletion
	environment.pathsToLink = [ "/share/zsh" ];
}