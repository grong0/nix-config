{ lib, ... }: {
	system.activationScripts = {
		base-dirs = {
			text = ''
				mkdir -p /nix/var/nix/profiles/per-user/kloenk
			'';
			deps = [ ];
		};
	};

	networking.networkmanager.enable = lib.mkForce false;
}
