{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "git-abbreviations";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
    ];

    shellAbbrs = {
      zed = "zeditor";
    };

    shellInit = ''
      if test -f ${config.age.secrets.rustic_repo.path}
          set -gx RUSTIC_REPOSITORY (cat ${config.age.secrets.rustic_repo.path})
      end
    '';
  };
}
