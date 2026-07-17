rec {
  stateVersion = "26.05";

  timeZone = "Asia/Ho_Chi_Minh";
  locale = "en_US.UTF-8";

  identity = import ./identity.nix;
  keybind = import ./keybind.nix;
  tools = import ./tools.nix;
  network = import ./network.nix;

  dirs = {
    home = "/home/${identity.username}";
    nixConfig = "${dirs.home}/nix-config";
  };

  fonts = import ./fonts.nix;
  glyphs = import ./glyphs.nix;

  hashedPassword = "$6$D0ewzu8Rhwdgv0k8$6SPkDIIRUKlRmC8.Sk89TUCdJYs35bG1aUN641wZWcsP/ul25wICjEq8sz57cIs1qGmoV4OdRcKlrmDiSPdqG.";
}
