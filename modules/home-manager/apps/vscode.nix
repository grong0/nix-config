{ pkgs, ... } : {
	home.packages = with pkgs; [
		nixd
		texliveMedium
	];

	programs.vscode = {
		enable = true;
		package = pkgs.unstable.vscode;
		mutableExtensionsDir = false;
		profiles.default = {
			enableExtensionUpdateCheck = false;
			extensions = with pkgs.unstable.vscode-extensions; [
				# QOL
				bierner.emojisense
				aaron-bond.better-comments
				usernamehw.errorlens
				mhutchie.git-graph
				# DONT-USE visualstudioexptteam.vscodeintellicode
				# DONT-USE visualstudioexptteam.intellicode-api-usage-examples
				christian-kohler.path-intellisense
				# AUTHOR searking.preview-vscode
				codezombiech.gitignore
				ms-vsliveshare.vsliveshare
				ms-vscode-remote.remote-ssh
				# AUTHOR mikeylau.typewriter-auto-scroll
				editorconfig.editorconfig
				gruntfuggly.todo-tree

				# Global Themeing
				pkief.material-icon-theme

				# Python
				njpwerner.autodocstring
				# ms-python.black-formatter
				# ms-python.isort
				ms-python.vscode-pylance
				ms-python.python
				ms-python.debugpy
				charliermarsh.ruff
				# EXTENSION NOT USING donjayamanne.python-environment-manager
				# AUTHOR kevinrose.vsc-python-indent
				# AUTHOR zeshuaro.vscode-python-poetry
				ms-toolsai.jupyter
				ms-toolsai.jupyter-keymap
				ms-toolsai.jupyter-renderers
				ms-toolsai.vscode-jupyter-slideshow
				ms-toolsai.vscode-jupyter-cell-tags

				# Webdev
				# BASE VSCODE formulahendry.auto-rename-tag
				# AUTHOR sidthesloth.html5-boilerplate
				ecmel.vscode-html-css
				# AUTHOR zignd.html-css-class-completion
				ritwickdey.liveserver
				esbenp.prettier-vscode
				# NOT USING svipas.prettier-plus
				# AUTHOR yoavbls.pretty-ts-errors
				prisma.prisma
				# AUTHOR emranweb.daisyui-snippet
				dbaeumer.vscode-eslint
				# AUTHOR otovo-oss.htmx-tags
				bradlc.vscode-tailwindcss

				# Java
				vscjava.vscode-java-debug
				vscjava.vscode-gradle
				redhat.java
				vscjava.vscode-maven
				vscjava.vscode-java-dependency
				vscjava.vscode-java-test

				# Rust
				# AUTHOR lorenzopirro.rust-flash-snippets
				rust-lang.rust-analyzer

				# C/C++
				# AUTHOR harry-ross-software.c-snippets
				ms-vscode.cpptools
				# AUTHOR danielpinto8zz6.c-cpp-compile-run
				twxs.cmake
				ms-vscode.cmake-tools
				vadimcn.vscode-lldb

				# C#
				ms-dotnettools.csharp
				ms-dotnettools.csdevkit
				ms-dotnettools.vscode-dotnet-runtime

				# Unity
				# AUTHOR visualstudiotoolsforunity.vstuc
				# AUTHOR kleber-swf.unity-code-snippets

				# Markdown
				yzhang.markdown-all-in-one
				davidanson.vscode-markdownlint

				# Misc
				# AUTHOR geequlim.godot-tools
				jnoortheen.nix-ide
				mechatroner.rainbow-csv
				# AUTHOR pixl-garden.bongocat
				tamasfe.even-better-toml
				# AUTHOR platformio.platformio-ide
				redhat.vscode-xml
				azdavis.millet
				james-yu.latex-workshop
				streetsidesoftware.code-spell-checker

				# Keil Studio Pack
				redhat.vscode-yaml
				llvm-vs-code-extensions.vscode-clangd
			] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
				{
					name = "platformio-ide";
					publisher = "PlatformIO";
					version = "3.3.4";
					sha256 = "QF5jdHKOjlxPaPD5OnzgzaQIWmmENVtsmocedpfkrPw=";
				}
				{
					name = "vscode-c-cpp-config";
					publisher = "franneck94";
					version = "6.3.0";
					sha256 = "oLxZt3ww0GT7QKXg2x7u3V8nd4H5KBUDGzJppQ5fRcs=";
				}
				{
					name = "htmx-tags";
					publisher = "otovo-oss";
					version = "0.0.8";
					sha256 = "sF5VpdmPluygAiGt9a9E/bM/VzA6a++0dR87dweMCyQ=";
				}
				{
					name = "wgsl-analyzer";
					publisher = "wgsl-analyzer";
					version = "0.12.121";
					sha256 = "ANcXjZDjrDYFSblO3Xt1wPTmT8jsYVcsQV0LkmZxpiM=";
				}
				{
					name = "vhdl-ls";
					publisher = "hbohlin";
					version = "0.7.0";
					sha256 = "sha256-Tnqy78daW0EQ590RGREbTsL8lPFTrKvi42T2pG6e1bk=";
				}
				{
					name = "vhdl-formatter";
					publisher = "vinrobot";
					version = "1.0.5";
					sha256 = "sha256-C26ja184xLG0lFIWV21lUHGRCLEWDuaAxjceiUZMeOw=";
				}
				{
					name = "yuck";
					publisher = "eww-yuck";
					version = "0.0.3";
					sha256 = "sha256-DITgLedaO0Ifrttu+ZXkiaVA7Ua5RXc4jXQHPYLqrcM=";
				}
				# Keil Studio Pack
				{
					name = "keil-studio-pack";
					publisher = "Arm";
					version = "1.20.3";
					sha256 = "sha256-8XXK6u1QoNt3K6VhfrN0cETfE1rD30ZKKKvaEMVQubg=";
				}
				{
					name = "cmsis-csolution";
					publisher = "Arm";
					version = "1.70.0";
					sha256 = "sha256-pKrGg/sOnbJJvFQScXLY+JUH3KY0dYkT6NedXvlKhB4=";
				}
				{
					name = "vscode-cmsis-debugger";
					publisher = "Arm";
					version = "1.8.0";
					sha256 = "sha256-q238Ckz2jt/Yi+54POD16WW9nJOMF8R3R9hwCKU+0dw=";
				}
				{
					name = "environment-manager";
					publisher = "Arm";
					version = "1.26.0";
					sha256 = "sha256-UInK53Ec2zLlFaNa6WTqaOhYrk4IRIF7RUYMtephXS0=";
				}
				{
					name = "arm";
					publisher = "dan-c-underwood";
					version = "1.7.4";
					sha256 = "sha256-gZBM980AoD+0wnfHXJK9sqCuuLtRY08JnO3Qdq/TRfc=";
				}
				# DOESN'T WORK : Server: Start failed: Error: write EPIPE
				# {
				# 	name = "ty";
				# 	publisher = "astral-sh";
				# 	version = "2026.20.0";
				# 	sha256 = "sha256-RveYO0k5wFotZ6R+7vYAIKoHBaurLPzx0Uv0EMPeinc=";
				# }
			];
			# TODO: the native window bar is back, find a way to remove it
			userSettings = {
				# Structure
				# Workbench
				"workbench.startupEditor" = "none";
				"workbench.layoutControl.enabled" = false;
				"workbench.tips.enabled" = false;
				"workbench.sideBar.location" = "right";
				"window.commandCenter" = false;
				"window.menuBarVisibility" = "toggle";
				"window.titleBarStyle" = "native";
				"breadcrumbs.enabled" = false;
				"update.mode" = "none";

				# Activity Bar Icons in Status Bar
				# "activitusbar.alignment" = "Left";
				# "zenMode.showTabs" = "none";
				# "workbench.activityBar.location" = "hidden";
				# "cmake.options.statusBarVisibility" = "icon";

				# File Explorer
				"files.defaultLanguage" = "\${activeEditorLanguage}";
				"files.insertFinalNewline" = true;
				"files.trimTrailingWhitespace" = true;
				"files.trimFinalNewlines" = true;

				# Minimal Mode
				"zenMode.centerLayout" = false;
				"zenMode.fullScreen" = false;
				"zenMode.hideLineNumbers" = false;
				"zenMode.hideStatusBar" = false;
				"zenMode.silentNotifications" = true;
				"zenMode.showTabs" = "none";

				# Editor
				"editor.cursorBlinking" = "blink"; #smooth
				"editor.cursorStyle" = "block"; #block-outline
				"editor.cursorWidth" = 3;
				"editor.cursorSmoothCaretAnimation" = "off";
				# "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'Fira Code', Consolas, 'Courier New', monospace";
				# "editor.fontSize" = 18;
				"editor.fontWeight" = "500"; # Medium
				"editor.formatOnSave" = true;
				"editor.minimap.autohide" = "mouseover";
				"editor.foldingHighlight" = false;
				"editor.smoothScrolling" = true;
				"editor.fontLigatures" = true;
				# "editor.lineHeight" = 23; # 28 # Ratio = 18/23
				"editor.renderLineHighlight" = "all";
				"editor.guides.indentation" = false;
				"editor.inlayHints.enabled" = "off";
				"explorer.sortOrder" = "type";
				"editor.bracketPairColorization.enabled" = false;
				"editor.linkedEditing" = true;
				"editor.codeActionsOnSave" = {
					"source.fixAll" = "explicit";
					"source.organizeImports" = "explicit";
				};

				# Terminal
				"terminal.external.osxExec" = "alacritty.app";
				"terminal.integrated.smoothScrolling" = true;
				# "terminal.integrated.fontSize" = 14;
				"terminal.integrated.fontWeight" = "500";
				"terminal.integrated.cursorBlinking" = true;
				"terminal.integrated.defaultProfile.linux" = "zsh";
				"terminal.integrated.enableMultiLinePasteWarning" = "always";

				# Personalization
				"workbench.iconTheme" = "material-icon-theme";
				"files.autoSave" = "afterDelay";
				"terminal.integrated.gpuAcceleration" = "on";
				"editor.insertSpaces" = false;
				"explorer.confirmDragAndDrop" = false;
				"editor.detectIndentation" = false;
				"diffEditor.ignoreTrimWhitespace" = false;
				"workbench.productIconTheme" = "bongocat";
				"explorer.confirmDelete" = false;
				"chat.disableAIFeatures" = true;
				"window.zoomLevel" = 0;
				# Git
				"git.openRepositoryInParentFolders" = "always";
				"git.autofetch" = true;

				# Languages
				# NixOS
				"nix.serverPath" = "nixd";
				"nix.enableLanguageServer" = true;
				"nix.formatterPath" = [
					"alejandra"
					"nixpkgs-fmt"
					"nixfmt"
					"treefmt"
					"--stdin"
					"{file}"
					"nix"
					"fmt"
					"--"
					"-"
				];
				"nix.serverSettings" = {
					"nixd" = {
						"formatting" = {
							"command" = [
								"nixpkgs-fmt"
							];
						};
						"options" = {
							# "nixos" = {
							# 	"expr" = "${builtins.getFlake '/absolute/path/to/flake'.nixosConfigurations.<name>.options}";
							# };
							# "home-manager" = {
							# 	"expr" = "${builtins.getFlake '/absolute/path/to/flake'.homeConfigurations.<name>.options}";
							# };
							# Tip: use ${workspaceFolder} variable to define path
							# "nix-darwin" = {
							# 	"expr" = "(builtins.getFlake \"${workspaceFolder}/path/to/flake\").darwinConfigurations.<name>.options";
							# };
						};
					};
					"nixpkgs" = {
						"expr" = "import <nixpkgs> { }";
					};
					"formatting" = {
						"command" = ["alejandra"];
					};
				};
				"[nix]" = {
					"editor.detectIndentation" = false;
					"editor.tabSize" = 4;
					"editor.insertSpaces" = false;
				};
				# Python
				"[python]" = {
					"editor.defaultFormatter" = "charliermarsh.ruff";
					"editor.formatOnType" = true;
					"editor.insertSpaces" = true;
				};
				# "python.languageServer" = "Jedi";
				# REQUIRES PYLANCE
				"python.analysis.autoImportCompletions" = true;
				"python.analysis.typeCheckingMode" = "standard";
				# Java
				"[java]" = {
					"editor.defaultFormatter" = "redhat.java";
				};
				# Rust
				"[rust]" = {
					"editor.defaultFormatter" = "rust-lang.rust-analyzer";
				};
				# HTML
				"[html]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				# CSS
				"[css]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				"files.associations" = {
					"*.css" = "css";
					"css" = "css";
					"*.rcss" = "css";
					"*.rml" = "html";
				};
				# SCSS
				"[scss]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				# Javascript + Flavors
				"[javascript]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				"javascript.updateImportsOnFileMove.enabled" = "always";
				"[typescript]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				"[javascriptreact]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				"[typescriptreact]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				# Svelte
				"[svelte]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				# JSON
				"[json]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
					"editor.formatOnSave" = false;
				};
				"[jsonc]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				# C
				"[c]" = {
					"editor.defaultFormatter" = "ms-vscode.cpptools";
				};
				# C++
				"[cpp]" = {
					"editor.defaultFormatter" = "ms-vscode.cpptools";
				};
				"c-cpp-compile-run.should-show-notifications" = false;
				"C_Cpp.codeAnalysis.clangTidy.enabled" = true;
				# CMAKE
				"cmake.configureOnOpen" = true;
				# Markdown
				"[markdown]" = {
					"editor.defaultFormatter" = "DavidAnson.vscode-markdownlint";
				};
				# YAML
				"[yaml]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};

				# Extension Configuration
				# Prettier
				"prettier.useTabs" = true;
				"prettier.printWidth" = 132;
				"prettier.tabWidth" = 4;
				"prettier.documentSelectors" = [ "/home/garrett/.config/Code/User/settings.json" ];
				# LiveServer
				"liveServer.settings.donotVerifyTags" = true;
				"liveServer.settings.donotShowInfoMsg" = true;
				# Emmet
				"emmet.includeLanguages" = {
					"javascript" = "javascriptreact";
				};
				# Emojisense
				"emojisense.languages" = {
					"*" = {
						"markupCompletionsEnabled" = true;
						"emojiDecoratorsEnabled" = false;
					};
				};
				# Better Comments
				"better-comments.highlightPlainText" = true;
				# Godot
				"godotTools.editorPath.godot4" = "/home/garrett/.nix-profile/bin/godot4";
				# LaTeX Workshop
				"latex-workshop.latex.tools" = [
					{
						"name" = "latexmk";
						"command" = "latexmk";
						"args" = [
							"-synctex=1"
							"-interaction=nonstopmode"
							"-file-line-error"
							"-pdf"
							"-outdir=%OUTDIR%"
							"%DOC%"
						];
						"env" = {};
					}
					{
						"name" = "xelatex";
						"command" = "xelatex";
						"args" = [
							"-synctex=1"
							"-interaction=nonstopmode"
							"-file-line-error"
							"%DOC%"
						];
						"env" = {};
					}
					{
						"name" = "pdflatex";
						"command" = "pdflatex";
						"args" = [
							"-synctex=1"
							"-interaction=nonstopmode"
							"-file-line-error"
							"%DOC%"
						];
						"env" = {};
					}
					{
						"name" = "bibtex";
						"command" = "bibtex";
						"args" = [
							"%DOCFILE%"
						];
						"env" = {};
					}
				];
				"latex-workshop.latex.recipes" = [
					{
						"name" = "pdfLaTeX";
						"tools" = [
							"pdflatex"
						];
					}
					{
						"name" = "latexmk 🔃";
						"tools" = [
							"latexmk"
						];
					}
					{
						"name" = "xelatex";
						"tools" = [
							"xelatex"
						];
					}
					{
						"name" = "pdflatex ➞ bibtex ➞ pdflatex`×2";
						"tools" = [
							"pdflatex"
							"bibtex"
							"pdflatex"
							"pdflatex"
						];
					}
					{
						"name" = "xelatex ➞ bibtex ➞ xelatex`×2";
						"tools" = [
							"xelatex"
							"bibtex"
							"xelatex"
							"xelatex"
						];
					}
				];
				# VHDL
				"vhdl.formatter.case" = {
					"keyword" = "LowerCase";
					"typename" = "LowerCase";
				};
			};
		};
	};
}
