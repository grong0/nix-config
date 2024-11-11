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

	networking.hostName = "Garretts-Laptop";

	boot.kernelParams = [ "amd_iommu=off" "iommu=off" ];

	microsoft-surface = {
		# ipts.enable = true;
		surface-control.enable = true;
	};
}
