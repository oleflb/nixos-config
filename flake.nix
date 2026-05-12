{
	description = "NixOS System Configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	
	outputs = { self, nixpkgs, home-manager, ... }: {
		nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./hosts/desktop/configuration.nix
				./hosts/desktop/hardware-configuration.nix
				
				# Modules
				./modules/system/bootloader.nix
				# ./modules/desktop/niri.nix
				./modules/desktop/cosmic.nix
				./modules/desktop/helix.nix
				./modules/desktop/lemurs.nix
				./modules/desktop/steam.nix

				# Users
				./users/ole/user.nix

				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.ole = import ./users/ole/home.nix;
				}
			];
		};
	};
}
