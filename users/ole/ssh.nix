{ ... }:

{
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    extraConfig = ''
      ServerAliveInterval 60
      ServerAliveCountMax 3
    '';
  };
}
