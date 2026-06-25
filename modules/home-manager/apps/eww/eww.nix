{ ... }: {
	programs.eww = {
		enable = true;
		scssConfig = builtins.readFile ./config/eww.scss;
		yuckConfig = builtins.readFile ./config/eww.yuck;
	};
}
