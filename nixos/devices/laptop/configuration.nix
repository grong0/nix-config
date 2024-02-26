{ config, pkgs, lib, ... }:

{
	imports = [
		#<nixpkgs/nixos/modules/virtualization/qemu-vm.nix>
	];

	networking.hostName = "Garretts-Laptop";

	boot.kernelParams = [ "amd_iommu=off" "iommu=off" ];
}
