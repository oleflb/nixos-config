{ ... }:

{
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    matchBlocks."*" = {
      addKeysToAgent = "yes";

      extraOptions = {
        ServerAliveInterval = "60";
        ServerAliveCountMax = "3";
      };
    };
  };
}
