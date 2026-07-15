{
  force = true;
  default = "Google";
  order = [ ];

  engines = {
    "Google" = {
      definedAliases = [ ":g" ];

      urls = [{
        template = "https://www.google.com/search?client=firefox-b-d&channel=entpr&q={searchTerms}";
      }];
    };

    "DuckDuckGo" = {
      definedAliases = [ ":d" ];

      urls = [{
        template = "https://duckduckgo.com/?q={searchTerms}";
      }];
    };

    "NuGet" = {
      definedAliases = [ ":ng" ];

      urls = [{
        template = "https://www.nuget.org/packages?q={searchTerms}";
      }];
    };

    "Nixpkgs" = {
      definedAliases = [ ":np" ];

      urls = [{
        template = "https://search.nixos.org/packages?query={searchTerms}";
      }];
    };

    "NixOS" = {
      definedAliases = [ ":no" ];

      urls = [{
        template = "https://search.nixos.org/options?query={searchTerms}";
      }];
    };

    "Home-Manager" = {
      definedAliases = [ ":hm" ];

      urls = [{
        template = "https://search.nixos.org/options?channel=unstable&show=home-manager&query={searchTerms}";
      }];
    };

    "Youtube" = {
      definedAliases = [ ":yt" ];

      urls = [{
        template = "https://www.youtube.com/results?search_query={searchTerms}";
      }];
    };

    "Wikipedia" = {
      definedAliases = [ ":w" ];

      urls = [{
        template = "https://en.wikipedia.org/w/index.php?search={searchTerms}";
      }];
    };

    "SoundCloud" = {
      definedAliases = [ ":sc" ];

      urls = [{
        template = "https://soundcloud.com/search?q={searchTerms}";
      }];
    };

    "Github" = {
      definedAliases = [ ":gh" ];

      urls = [{
        template = "https://github.com/search?q={searchTerms}";
      }];
    };

    "Gitlab" = {
      definedAliases = [ ":gl" ];

      urls = [{
        template = "https://gitlab.com/search?search={searchTerms}";
      }];
    };

    "StackOverflow" = {
      definedAliases = [ ":so" ];

      urls = [{
        template = "https://stackoverflow.com/search?q={searchTerms}";
      }];
    };

    "Amazon.com".metaData.hidden = true;
    "Bing".metaData.hidden = true;
    "eBay".metaData.hidden = true;
  };
}
