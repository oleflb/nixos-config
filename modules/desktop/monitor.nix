{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    pkgs.nvtopPackages.amd
  ];
}
