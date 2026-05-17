{ pkgs, ... }:

{
	home.username = "ole";
	home.homeDirectory = "/home/ole";
	home.stateVersion = "25.11";

	programs.home-manager.enable = true;
	programs.firefox.enable = true;
	programs.keepassxc.enable = true;

	imports = [
	  ./agenix.nix
		./alacritty.nix
		./fish.nix
		./git.nix
		./messengers.nix
		./rustic.nix
		./starship.nix
		./ssh.nix
		./uv.nix
		./xdg.nix
		./zed.nix
		./zoxide.nix
	];

	home.packages = with pkgs; [
		nextcloud-client
		dust
	];

	services.nextcloud-client = {
		enable = true;
		startInBackground = true;
	};
}
