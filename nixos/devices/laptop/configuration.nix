{ config, pkgs, lib, ... }:

{
	imports = [
		# <nixpkgs/nixos/modules/virtualization/qemu-vm.nix>
		<nixos-hardware/microsoft/surface/common>
		# <nixos-hardware/microsoft/surface/surface-laptop-amd>
		# <nixos-hardware/common/pc>
		# <nixos-hardware/common/pc/sdd>
		# <nixos-hardware/common/cpu/amd>
		# <nixos-hardware/common/cpu/amd/pstate.nix>
		# <nixos-hardware/common/gpu/amd>
	];

	# security.sudo.extraRules = [{
	# 	commands = [{
	# 		command = "/run/current-system/sw/bin/tee";
	# 		options = [ "NOPASSWD" ];
	# 	}];
	# 	groups = [ "acpi" ];
	# }];
	# users.groups.acpi = {};
	# users.users.garrett.extraGroups = [ "acpi" ];
	
	systemd.user.services.open-acpi = {
		description = "Opens editing of platform_profile in acpi to users.";
		script = ''
			chmod u+w /sys/firmware/acpi/platform_profile
		'';
		wantedBy = [ "multi-user.target" ];
	};
	
	networking.hostName = "Garretts-Laptop";
	# networking.networkmanager.enable = true;

	boot.kernelParams = [ "amd_iommu=off" "iommu=off" ];

	microsoft-surface = {
		# ipts.enable = true;
		surface-control.enable = true;
	};
}
