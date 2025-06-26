# This file defines overlays
{inputs, ...}: {
	# This one brings our custom packages from the 'pkgs' directory
	additions = final: _prev: import ../pkgs {pkgs = final;};

	# This one contains whatever you want to overlay
	# You can change versions, add patches, set compilation flags, anything really.
	# https://nixos.wiki/wiki/Overlays
	modifications = final: prev: {
		# example = prev.example.overrideAttrs (oldAttrs: rec {
		# ...
		# });
	};

	# When applied, the unstable nixpkgs set (declared in the flake inputs) will
	# be accessible through 'pkgs.unstable'
	unstable-packages = final: _prev: {
		unstable = import inputs.nixpkgs-unstable {
			system = final.system;
			config.allowUnfree = true;
		};
	};
	# stable-packages = final: _prev: {
	# 	stable = import inputs.nixpkgs-stable {
	# 		system = final.system;
	# 		config.allowUnfree = true;
	# 	};
	# };

	# nix-ros-overlay = final: _prev: {
	# 	nix-ros-overlay = import inputs.nix-ros-overlay {
	# 		system = final.system;
	# 	};
	# };

	# Postman
	# postman = final: prev: {
	# 	postman = prev.postman.overrideAttrs(old: rec {
	# 	version = "20230716100528";
	# 		src = final.fetchurl {
	# 			url = "https://web.archive.org/web/${version}/https://dl.pstmn.io/download/latest/linux_64";
	# 			sha256 = "sha256-svk60K4pZh0qRdx9+5OUTu0xgGXMhqvQTGTcmqBOMq8=";

	# 			name = "${old.pname}-${version}.tar.gz";
	# 		};
	# 	});
	# };
}
