let
  ole = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDaUBmeZ5KsVoPXIhQAQ6prruERRkC5Exfebfd5+5RzS ole@nixos";
in
{
  "rustic_password.age".publicKeys = [ ole ];
  "rustic_repo_location.age".publicKeys = [ ole ];
}
