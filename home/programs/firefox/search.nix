{
  force = true;
  default = "google";
  order = [ ];

  engines = {
    "google" = {
      definedAliases = [ ":g" ];

      urls = [{
        template = "https://www.google.com/search?client=firefox-b-d&channel=entpr&q={searchTerms}";
      }];
    };

    "duckduckgo" = {
      definedAliases = [ ":d" ];

      urls = [{
        template = "https://duckduckgo.com/?q={searchTerms}";
      }];
    };

    "nuget" = {
      definedAliases = [ ":ng" ];

      urls = [{
        template = "https://www.nuget.org/packages?q={searchTerms}";
      }];
    };

    "nixpkgs" = {
      definedAliases = [ ":np" ];

      urls = [{
        template = "https://search.nixos.org/packages?query={searchTerms}";
      }];
    };

    "nixos" = {
      definedAliases = [ ":no" ];

      urls = [{
        template = "https://search.nixos.org/options?query={searchTerms}";
      }];
    };

    "home-manager" = {
      definedAliases = [ ":hm" ];

      urls = [{
        template = "https://search.nixos.org/options?channel=unstable&show=home-manager&query={searchTerms}";
      }];
    };

    "youtube" = {
      definedAliases = [ ":yt" ];

      urls = [{
        template = "https://www.youtube.com/results?search_query={searchTerms}";
      }];
    };

    "wikipedia" = {
      definedAliases = [ ":w" ];

      urls = [{
        template = "https://en.wikipedia.org/w/index.php?search={searchTerms}";
      }];
    };

    "soundcloud" = {
      definedAliases = [ ":sc" ];

      urls = [{
        template = "https://soundcloud.com/search?q={searchTerms}";
      }];
    };

    "github" = {
      definedAliases = [ ":gh" ];

      urls = [{
        template = "https://github.com/search?q={searchTerms}";
      }];
    };

    "gitlab" = {
      definedAliases = [ ":gl" ];

      urls = [{
        template = "https://gitlab.com/search?search={searchTerms}";
      }];
    };

    "stack-overflow" = {
      definedAliases = [ ":so" ];

      urls = [{
        template = "https://stackoverflow.com/search?q={searchTerms}";
      }];
    };

    "amazondotcom-us".metaData.hidden = true;
    "bing".metaData.hidden = true;
    "ebay".metaData.hidden = true;
  };
}
