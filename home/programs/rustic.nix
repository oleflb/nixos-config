{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.rustic
  ];

  xdg.configFile."rustic/rustic.toml".text = ''
    [repository]
    password-file = "${config.age.secrets.rustic_password.path}"
    no-cache = true

    [backup]
    # Skip backing up directories containing these target files
    exclude-if-present = [ ".nobackup", "CACHEDIR.TAG" ]

    [[backup.snapshots]]
    sources = [
      "/home/ole/.ssh",
      "/home/ole/.nixos-config",
      "/home/ole/hulk-stuff",
      "/home/ole/Documents",
    ]

    [forget]
    keep-daily = 14
    keep-weekly = 5
  '';
}
