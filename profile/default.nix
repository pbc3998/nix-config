rec {
  stateVersion = "26.05";

  name = "PBCDev";
  userName = "pbcdev";

  email = {
    main = "baochaupham4096@gmail.com";
    sub = "baochaupham3205@gmail.com";
  };

  homeDir = "/home/${userName}";
  nixConfigDir = "${homeDir}/nix-config";

  defaultTools = import ./tools.nix;

  hashedPassword = "$6$D0ewzu8Rhwdgv0k8$6SPkDIIRUKlRmC8.Sk89TUCdJYs35bG1aUN641wZWcsP/ul25wICjEq8sz57cIs1qGmoV4OdRcKlrmDiSPdqG.";
}
