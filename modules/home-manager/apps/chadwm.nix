{ pkgs, ... }: {
	home = {
		packages = with pkgs; [
			# imlib2
			# dash
			picom
			# feh
			# acpi
			# eww
			(
				pkgs.dwm.overrideAttrs(oldAttrs: {
					buildInputs = oldAttrs.buildInputs ++ (with pkgs; [ imlib2 ]);
					src = pkgs.fetchFromGitHub {
						owner = "siduck";
						repo = "chadwm";
						rev = "978dc36e039725838a72bcd9d266e55fa265e522";
						hash = "sha256-nV5wyw7mK6bAEBUEZzmfkjsA2AZbw1nJI8u/mihhbwY";
					};
					prePatch = ''
						cd chadwm
						# make install
					'';
				})
			)
		];
	};
}