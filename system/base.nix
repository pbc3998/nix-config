{ settings, pkgs, ... }:
{
  system.stateVersion = settings.stateVersion;

  time.timeZone = settings.timeZone;
  i18n.defaultLocale = settings.locale;

  imports = [
    ./modules/options
  ];

  environment.systemPackages = [ pkgs.mkcert ];
}
