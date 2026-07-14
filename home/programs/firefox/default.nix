{ pkgs, settings, ... }:
{
  programs.firefox = {
    enable = true;
    #package = pkgs.firefox-devedition;
    profiles.${settings.profile.username} = {
      id = 0;
      name = settings.profile.username;
      isDefault = true;
      extensions = import ./extensions { inherit pkgs; };

      settings = import ./settings.nix;
    };

    policies = {
      DisableAppUpdate = false;
      AppUpdateURL = "https://aus5.mozilla.org/update/6/%PRODUCT%/%VERSION%/%BUILD_ID%/%BUILD_TARGET%/%LOCALE%/%CHANNEL%/%OS_VERSION%/%SYSTEM_CAPABILITIES%/%DISTRIBUTION%/%DISTRIBUTION_VERSION%/update.xml";
      AutomaticallyDownloadSandboxModules = true;
    };
  };
}
