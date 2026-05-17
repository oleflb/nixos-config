{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../system/core/bootloader.nix
    ../../system/core/user.nix
    ../../system/desktop/cosmic.nix
    ../../system/desktop/helix.nix
    ../../system/desktop/lemurs.nix
    ../../system/desktop/monitor.nix
    ../../system/desktop/podman.nix
    ../../system/desktop/steam.nix

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { inherit inputs; };
      home-manager.users.ole = import ../../home/ole/home.nix;
    }
  ];

  time.timeZone = "Europe/Berlin";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Required for Steam
  nixpkgs.config.allowUnfree = true;

  hardware.cpu.amd.updateMicrocode = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager.enable = true;

  programs.nix-ld.enable = true;
  programs.fuse.userAllowOther = true;

  environment.etc."ssl/cert.pem".source = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";

  environment.systemPackages = with pkgs; [
    pciutils
    git
  ];

  system.stateVersion = "25.11";
}
