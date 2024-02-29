{ config, pkgs, lib, ... }:

{
    networking.hostName = "Garretts-Desktop";

    #boot.kernelParams = [ "nvidia_drm.modeset=1" ];
    #boot.initrd = {
    #  enable = true;
    #  kernelModules = [
    #    "nvidia"
    #    "nvidia_modeset"
    #    "nvidia_uvm"
    #    "nvidia_drm"
    #  ];
    #};
    #boot.extraModprobeConfig = ''
    #  options nvidia-drm modeset=1
    #'';

    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    #nixpkgs.config.allowUnfreePredicate = pkg:
    #  builtins.elem (lib.getName pkg) [
    #    "#nvidia-x11"
    #  ];

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        # Modesetting is required.
        modesetting.enable = true;

        # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
        powerManagement.enable = false;
        # Fine-grained power management. Turns off GPU when not in use.
        # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        powerManagement.finegrained = false;

        # Use the NVidia open source kernel module (not to be confused with the
        # independent third-party "nouveau" open source driver).
        # Support is limited to the Turing and later architectures. Full list of
        # supported GPUs is at:
        # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
        # Only available from driver 515.43.04+
        # Currently alpha-quality/buggy, so false is currently the recommended setting.
        open = false;

        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`.
        nvidiaSettings = true;

        # Optionally, you may need to select the appropriate driver version for your specific GPU.
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

  #environment.sessionVariables.NIXOS_OZONE_WL = "1";

  #programs.hyprland.enableNvidiaPatches = true;
}
