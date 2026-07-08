{ profile, ... }:
{
  system.stateVersion = profile.stateVersion;

  time.timeZone = profile.timeZone;
  i18n.defaultLocale = profile.locale;

  imports = [
    ./programs
    ./services
    ./modules
  ];
}
