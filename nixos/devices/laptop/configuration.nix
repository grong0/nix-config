{ config, pkgs, lib, ... }:

{
	imports = [
		#<nixpkgs/nixos/modules/virtualization/qemu-vm.nix>
		<nixos-hardware/microsoft/surface/common>
		# <nixos-hardware/microsoft/surface/surface-laptop-amd>
	];

	networking.hostName = "Garretts-Laptop";

	boot.kernelParams = [ "amd_iommu=off" "iommu=off" ];

	microsoft-surface = {
		# ipts.enable = true;
		surface-control.enable = true;
	};
}
