rec {
  name = "PBCDev";
  userName = "pbcdev";

  dirHome = "/home/${userName}";
  dirConfig = "${dirHome}/nix-config";

  email = import ./email.nix;
  defaultTools = import ./tools.nix;
}
