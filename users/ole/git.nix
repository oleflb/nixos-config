{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "oleflb";
        email = "45100017+oleflb@users.noreply.github.com";
      };

      signing = {
        key = "~/.ssh/id_ed25519.pub";
        signByDefault = true;
      };

      gpg.format = "ssh";
      pull.rebase = true;
      init.defaultBranch = "main";
    };
  };
}
