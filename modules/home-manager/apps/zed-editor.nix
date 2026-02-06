{ pkgs, lib, ... }: {
	# home.packages = with pkgs; [
	# 	vulkan-tools
	# 	mesa
	# ];
	# home.packages = with pkgs; [
	# 	zed-editor
	# ];

	programs.zed-editor = {
		enable = true;
		extensions = [ "nix" "toml" "ruff" "emmet" "SQL" "xml" "ocaml" "scss" "sml" "ini" "html" ];
		userKeymaps = [
			{
				context = "Editor";
				bindings = {
					ctrl-enter = "editor::NewlineBelow";
					ctrl-y = "editor::Redo";
				};
			}
		];
		userSettings = {
			autosave = {
				after_delay = {
					milliseconds = 1000;
				};
			};
			
			tab_size = 4;
			hard_tabs = true;

			preferred_line_length = 100;

			node = {
				path = lib.getExe pkgs.nodejs;
				npm_path = lib.getExe' pkgs.nodejs "npm";
			};

			assistant.enable = false;

			telemetry = {
				diagnostics = false;
				metrics = false;
			};

			relative_line_numbers = true;

			cursor_shape = "block";

			lsp = {
				rust-analyzer = {
					binary = {
						path = lib.getExe pkgs.rust-analyzer;
						path_lookup = true;
					};
				};
				nix = {
					binary = {
						path_lookup = true;
					};
				};
				python = {
					binary = {
						path_lookup = true;
					};
				};
				go = {
					binary = {
						path = lib.getExe pkgs.go;
						path_lookup = true;
					};
				};
			};

			languages = {
				"Python" = {
					hard_tabs = false;
				};
			};

    		# tell zed to use direnv and direnv can use a flake.nix enviroment.
			# load_direnv = "shell_hook";

			base_keymap = "VSCode";
		};
	};
}
