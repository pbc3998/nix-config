rec {
  stateVersion = "26.05";

  timeZone = "Asia/Ho_Chi_Minh";
  locale = "en_US.UTF-8";

  profile = import ./profile.nix;
  keybind = import ./keybind.nix;
  tools = import ./tools.nix;
  network = import ./network.nix;

  dirs = {
    home = "/home/${profile.username}";
    nixConfig = "${dirs.home}/nix-config";
  };

  hashedPassword = "$6$D0ewzu8Rhwdgv0k8$6SPkDIIRUKlRmC8.Sk89TUCdJYs35bG1aUN641wZWcsP/ul25wICjEq8sz57cIs1qGmoV4OdRcKlrmDiSPdqG.";
}
