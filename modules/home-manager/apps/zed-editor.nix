{ pkgs, lib, ... }: {
	# home.packages = with pkgs; [
	# 	vulkan-tools
	# 	mesa
	# ];

	programs.zed-editor = {
		enable = true;
		# extensions = [ "nix" "toml" "ruff" "emmet" "SQL" "xml" "ocaml" "scss" "sml" ];
		# userKeymaps = [
		# 	{
		# 		context = "Editor";
		# 		bindings = {
		# 			ctrl-enter = "editor::NewlineBelow";
		# 			ctrl-y = "editor::Redo";
		# 		};
		# 	}
		# ];
		# userSettings = {
		# 	# theme = {
		# 	# 	mode = "dark";
		# 	# 	dark = "Gruvbox Dark";
		# 	# 	light = "Gruvbox Light";
		# 	# };
		# 	autosave = {
		# 		after_delay = {
		# 			milliseconds = 1000;
		# 		};
		# 	};
		# 	tab_size = 4;

		# 	preferred_line_length = 100;

		# 	hard_tabs = true;

		# 	node = {
		# 		path = lib.getExe pkgs.nodejs;
		# 		npm_path = lib.getExe' pkgs.nodejs "npm";
		# 	};

		# 	assistant.enable = false;

		# 	telemetry = {
		# 		diagnostics = false;
		# 		metrics = false;
		# 	};

		# 	# relative_line_numbers = true;

  #           # centered_layout = {
  #               # left_padding = 0.15;
  #               # right_padding = 0.15;
  #           # };

  #           buffer_font_size = 18;
  #           buffer_font_family = "JetBrainsMono Nerd Font";
  #           buffer_font_fallbacks = [ "Symbols Nerd Font Mono" ];
  #           buffer_font_weight = 500;

  #           cursor_shape = "block";

  #           # Set with stylix
  #           # ui_font_family = "${config.stylix.}";

  #   		terminal = {
  #               # alternate_scroll = "off";
  #               # blinking = "off";
  #               # copy_on_select = false;
  #               # dock = "bottom";
  #               detect_venv = {
  #                   on = {
  #                       directories = [".env" "env" ".venv" "venv"];
  #                       activate_script = "default";
  #                   };
  #               };
  #               # env = {
  #               #     TERM = "alacritty";
  #               # };
  #               font_family = "JetBrainsMono Nerd Font";
  #               # font_features = null;
  #               font_size = 18;
  #               # line_height = "comfortable";
  #   			lineHeight = 28;
  #               # option_as_meta = false;
  #               # button = false;
  #               # shell = "system";
  #               #{
  #               #     program = "zsh";
  #               #};
  #               # toolbar = {
  #               #     title = true;
  #               # };
  #               working_directory = "current_project_directory";
  #           };

  #   		lsp = {
  #               rust-analyzer = {
  #                   binary = {
  #                       path = lib.getExe pkgs.rust-analyzer;
  #                       path_lookup = true;
  #                   };
  #               };
  #               nix = {
  #                   binary = {
  #                       path_lookup = true;
  #                   };
  #               };
  #   			python = {
  #   				binary = {
  #   					path_lookup = true;
  #   				};
  #   			};
		# 	go = {
		# 		binary = {
		# 			path = lib.getExe pkgs.go;
		# 			path_lookup = true;
		# 		};
		# 	};
  #           };

  #           languages = {
  #               "Python" = {
  #                   hard_tabs = false;
  #               };
  #           };

  #   		## tell zed to use direnv and direnv can use a flake.nix enviroment.
  #           # load_direnv = "shell_hook";

  #           base_keymap = "VSCode";
		# };
	};
}
