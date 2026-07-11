{ profile, ... }:
{
  system.stateVersion = profile.stateVersion;

  time.timeZone = profile.timeZone;
  i18n.defaultLocale = profile.locale;

  nix.settings.trusted-users = [ "root" "${profile.userName}" ];

  imports = [
    ./programs
    ./services
    ./modules
  ];
}
