{ pkgs, ... }:

{
	home.username = "ole";
	home.homeDirectory = "/home/ole";
	home.stateVersion = "25.11";

	programs.home-manager.enable = true;
	programs.firefox.enable = true;
	programs.keepassxc.enable = true;

	imports = [
		./git.nix
	];

	home.packages = with pkgs; [
		nextcloud-client
	];

	services.nextcloud-client = {
		enable = true;
		startInBackground = true;
	};
}
