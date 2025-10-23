{ pkgs, ... }: {
	home.packages = with pkgs; [
		obsidian
	];

# 	programs.obsidian = {
# 		enable = true;
# 		vaults = {
# 			obsidian-vault = {
# 				enable = true;
# 				path = "~/Documents/obsidian-vault";
# 			};
# 		};
# 		defaultSettings = {
# 			app = "
# {
#   'spellcheck': true,
#   'spellcheckDictionary': [
#     'FlexRAM',
#     'IMOs',
#     'Ecoflex',
#     'Flogeras'
#   ],
#   'alwaysUpdateLinks': true,
#   'pdfExportSettings': {
#     'includeName': true,
#     'pageSize': 'Letter',
#     'landscape': false,
#     'margin': '0',
#     'downscalePercent': 100
#   },
#   'autoPairBrackets': false,
#   'readableLineLength': false,
#   'showLineNumber': false,
#   'strictLineBreaks': true
# }
# 			";
# # 			appearance = "
# # {
# #   'cssTheme': 'Border',
# #   'nativeMenus': false,
# #   'translucency': false,
# # }
# # 			";
# 			communityPlugins = "
# [
#   'obsidian-latex-suite',
#   'tag-wrangler',
#   'obsidian-style-settings',
#   'obsidian-plantuml',
#   'obsidian-excalidraw-plugin',
#   'emoji-shortcodes',
#   'easy-typing-obsidian',
#   'dataview',
#   'notion-like-tables',
#   'obsidian-languagetool-plugin',
#   'obsidian-advanced-slides'
# ]
# 			";
# 			corePlugins = "
# {
#   'file-explorer': true,
#   'global-search': true,
#   'switcher': true,
#   'graph': true,
#   'backlink': true,
#   'canvas': true,
#   'outgoing-link': true,
#   'tag-pane': true,
#   'properties': false,
#   'page-preview': true,
#   'daily-notes': false,
#   'templates': true,
#   'note-composer': true,
#   'command-palette': true,
#   'slash-command': false,
#   'editor-status': true,
#   'bookmarks': true,
#   'markdown-importer': false,
#   'zk-prefixer': false,
#   'random-note': false,
#   'outline': true,
#   'word-count': true,
#   'slides': false,
#   'audio-recorder': false,
#   'workspaces': false,
#   'file-recovery': true,
#   'publish': false,
#   'sync': false,
#   'webviewer': false,
#   'footnotes': false,
#   'bases': true
# }
# 			";
# 			themes = [ "border" ];
# 		};
# 	};
}
