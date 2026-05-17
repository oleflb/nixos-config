{ ... }:

{
  # Set the default terminal shortcut to Alacritty
  xdg.configFile."cosmic/com.system76.CosmicSettings.Shortcuts/v1/custom".text = ''
    (
        custom: {
            "LauncherTerminal": (
                action: Spawn(["alacritty"]),
                modifiers: ["Super"],
                key: "t",
            ),
        },
    )
  '';

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "alacritty.desktop" ];
    };
  };
}
