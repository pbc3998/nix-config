{ pkgs, settings, ... }: {
  users.users.${settings.profile.username} = {
    isNormalUser = true;
    description = "user main";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs."${settings.tools.shell}";
    home = settings.dirs.home;
    hashedPassword = settings.hashedPassword;
  };
}
