{ pkgs, ... }: {
	programs.vscode = {
		enable = true;
		package = pkgs.vscode;
		mutableExtensionsDir = false;
		profiles.default = {
			enableExtensionUpdateCheck = false;
			extensions = with pkgs.vscode-extensions; [
				# QOL
				bierner.emojisense
				aaron-bond.better-comments
				usernamehw.errorlens
				mhutchie.git-graph
				visualstudioexptteam.vscodeintellicode
				visualstudioexptteam.intellicode-api-usage-examples
				christian-kohler.path-intellisense
				# AUTHOR searking.preview-vscode
				codezombiech.gitignore
				ms-vsliveshare.vsliveshare
				ms-vscode-remote.remote-ssh
				# AUTHOR mikeylau.typewriter-auto-scroll
				editorconfig.editorconfig

				# Global Themeing
				pkief.material-icon-theme

				# Python
				njpwerner.autodocstring
				ms-python.black-formatter
				ms-python.isort
				# DOESN'T WORK IN VSCODIUM ms-python.vscode-pylance
				ms-python.python
				ms-python.debugpy
				# EXTENSION NOT USING donjayamanne.python-environment-manager
				# AUTHOR kevinrose.vsc-python-indent
				# AUTHOR zeshuaro.vscode-python-poetry

				# Webdev
				formulahendry.auto-rename-tag
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

				# Misc
				# AUTHOR geequlim.godot-tools
				yzhang.markdown-all-in-one
				jnoortheen.nix-ide
				mechatroner.rainbow-csv
				# AUTHOR pixl-garden.bongocat
				tamasfe.even-better-toml
				# AUTHOR platformio.platformio-ide
				redhat.vscode-xml
				azdavis.millet
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
			];
			userSettings = {
				# Structure
				# Workbench
				"workbench.startupEditor" = "none";
				"workbench.layoutControl.enabled" = false;
				"workbench.tips.enabled" = false;
				"window.commandCenter" = false;
				"window.menuBarVisibility" = "toggle";
				"update.mode" = "none";
				"workbench.sideBar.location" = "right";

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
				"zenMode.silentNotifications" = false;
				"zenMode.showTabs" = "none";

				# Editor
				"editor.cursorBlinking" = "blink"; #smooth
				"editor.cursorStyle" = "block"; #block-outline
				"editor.cursorWidth" = 3;
				"editor.cursorSmoothCaretAnimation" = "off";
				# "editor.fontFamily" = "'JetBrainsMono Nerd Font'; 'Fira Code'; Consolas; 'Courier New'; monospace";
				# "editor.fontSize" = 18;
				"editor.fontWeight" = "500"; # Medium
				"editor.formatOnSave" = true;
				"editor.minimap.autohide" = true;
				"editor.foldingHighlight" = false;
				"editor.smoothScrolling" = true;
				"editor.fontLigatures" = true;
				"editor.lineHeight" = 23; # 28 # Ratio = 18/23
				"editor.renderLineHighlight" = "none";
				"editor.guides.indentation" = false;
				"editor.inlayHints.enabled" = "off";
				"explorer.sortOrder" = "type";
				"editor.bracketPairColorization.enabled" = false;

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
				"files.associations" = {
					"*.css" = "css";
					"css" = "css";
				};
				"explorer.confirmDragAndDrop" = false;
				"editor.detectIndentation" = false;
				"diffEditor.ignoreTrimWhitespace" = false;
				"workbench.productIconTheme" = "bongocat";
				"explorer.confirmDelete" = false;
				# Git
				"git.openRepositoryInParentFolders" = "always";
				"git.autofetch" = true;
				"window.zoomLevel" = 2;

				# Languages
				# NixOS
				"nix.serverPath" = "nixd";
				"nix.enableLanguageServer" = true;
				"nix.formatterPath" = "alejandra";
				"nix.serverSettings" = {
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
					"editor.defaultFormatter" = "ms-python.black-formatter";
					"editor.formatOnType" = true;
					"editor.insertSpaces" = true;
				};
				"python.languageServer" = "Jedi";
				# REQUIRES PYLANCE
				# "python.analysis.autoImportCompletions" = true;
				# "python.analysis.typeCheckingMode" = "basic";
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
				# SCSS
				"[scss]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				# Javascript
				"[javascript]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				"javascript.updateImportsOnFileMove.enabled" = "always";
				# Typescript
				"[typescript]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				# Svelte
				"[svelte]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
				};
				# JSON
				"[json]" = {
					"editor.defaultFormatter" = "esbenp.prettier-vscode";
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
			};
		};
	};
}
