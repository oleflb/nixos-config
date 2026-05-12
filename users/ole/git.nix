{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "oleflb";
    userEmail = "45100017+oleflb@users.noreply.github.com";

    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = "main";
    };
  };
}
