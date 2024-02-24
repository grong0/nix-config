{ config, pkgs, ... }:

{
	imports = [
		#<nixos-hardware/microsoft/surface/surface-laptop-amd>
		#<nixpkgs/nixos/modules/virtualization/qemu-vm.nix>
		../../modules/configuration-main.nix
	];

	networking.hostName = "Garretts-Laptop";

	boot.kernelParams = [ "amd_iommu=off" "iommu=off" ];
}