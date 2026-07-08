{ pkgs, profile, ... }: {
  users.users.${profile.userName} = {
    isNormalUser = true;
    description = "user main";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs."${profile.defaultTools.shell}";
    home = profile.homeDir;
    hashedPassword = profile.hashedPassword;
  };
}
