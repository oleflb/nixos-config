{ pkgs, ... }:

{
	users.users.ole = {
		isNormalUser = true;
		extraGroups = [ "wheel" "seat" ];
		shell = pkgs.fish;
	};

	programs.fish.enable = true;
}
