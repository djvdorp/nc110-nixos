# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/cc6a06bb-336f-4e9f-a5f0-fdd43e7f548f";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/0d008cef-303e-4a86-9892-b2b54e3adc20";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/db8410ad-2954-47de-a812-f3b43a148a81"; }
    ];

  nix.maxJobs = lib.mkDefault 4;
}
