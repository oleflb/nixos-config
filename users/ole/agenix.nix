{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.agenix.homeManagerModules.default
  ];

  home.packages = [
    inputs.agenix.packages.${pkgs.system}.default
  ];

  age.secrets.rustic_password = {
    file = ../../secrets/rustic_password.age;
    path = "${config.home.homeDirectory}/.agenix/rustic_password";
  };

  age.secrets.rustic_repo = {
    file = ../../secrets/rustic_repo_location.age;
    path = "${config.home.homeDirectory}/.agenix/rustic_repo_location";
  };
}
