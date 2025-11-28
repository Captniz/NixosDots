{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}:
{
  # Flake from https://github.com/0xc000022070/zen-browser-flake
  imports = [
    ../Themes/${userSettings.theme}/Firefox-override.nix
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];
    policies =
      let
        mkLockedAttrs = builtins.mapAttrs (
          _: value: {
            Value = value;
            Status = "locked";
          }
        );
      in
      {
        Preferences = mkLockedAttrs {
          "browser.aboutConfig.showWarning" = false;
          "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
          "browser.tabs.hoverPreview.enabled" = true;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.topsites.contile.enabled" = false;
          "privacy.resistFingerprinting" = true;
          "privacy.spoof_english" = 1;
          "dom.battery.enabled" = false;
          "gfx.webrender.all" = true;
          "network.http.http3.enabled" = true;
          "network.socket.ip_addr_any.disabled" = true;
          "browser.tabs.warnOnClose" = false;
          "browser.contentblocking.category" = "strict";
          "extensions.pocket.enabled" = false;
          "extensions.screenshots.disabled" = true;
          "fission.autostart.session" = true;
          "browser.search.region" = "IT";
          "doh-rollout.home-region" = "IT";
          "browser.startup.page" = 3;
          "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
          "accessibility.typeaheadfind.flashBar" = 0;
          "dom.forms.autocomplete.formautofill" = true;
          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;
          "security.sandbox.content.tempDirSuffix" = "985d528a-62b5-400a-a18d-b00f8131f702";
          "services.sync.declinedEngines" = "addons,prefs";
          "services.sync.engine.addons" = false;
          "services.sync.engine.creditcards" = true;
          "services.sync.engine.prefs" = false;
          "services.sync.engine.prefs.modified" = false;
          "extensions.autoDisableScopes" = 0;
          "accessibility.typeaheadfind" = true;
          "browser.ctrlTab.sortByRecentlyUsed" = true;
          "browser.engagement.ctrlTab.has-used" = true;
        };
        DisableTelemetry = true;
        DisableAppUpdate = true;
        DisableFirefoxStudies = true;
        DisableFeedbackCommands = true;
        DisablePocket = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        # add policies here...
      };

    profiles.simo = {
      id = 0; # 0 is the default profile; see also option "isDefault"
      name = "simo"; # name as listed in about:profiles
      isDefault = true; # can be omitted; true if profile ID is 0
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        # Check https://nur.nix-community.org/repos/rycee/ for more addons
        zotero-connector
        github-file-icons
        youtube-shorts-block
        adblocker-ultimate
        #adnauseam
      ];

      settings = {
        "zen.workspaces.continue-where-left-off" = true;
        "zen.view.compact.hide-tabbar" = true;
        "zen.view.compact.hide-toolbar" = true;
        "zen.welcome-screen.seen" = true;
        "zen.urlbar.behavior" = "float";
      };

      search = {
        force = true;
        engines =
          let
            nixSnowflakeIcon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          in
          {
            "Github" = {
              urls = [
                {
                  template = "https://github.com/search";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "https://github.githubassets.com/favicons/favicon-dark.png";
              definedAliases = [ "@gh" ];
            };

            "Youtube" = {
              urls = [
                {
                  template = "https://www.youtube.com/results";
                  params = [
                    {
                      name = "search_query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "https://www.youtube.com/favicon.ico";
              definedAliases = [ "@yt" ];
            };

            "Nix_packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = nixSnowflakeIcon;
              definedAliases = [ "@np" ];
            };

            "MyNixos" = {
              urls = [
                {
                  template = "https://mynixos.com/search";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = nixSnowflakeIcon;
              definedAliases = [ "@mn" ];
            };

            "NixOS_Wiki" = {
              urls = [
                {
                  template = "https://nixos.wiki/wiki/Special:Search";
                  params = [
                    {
                      name = "search";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = nixSnowflakeIcon;
              definedAliases = [ "@nw" ];
            };

            "NixUserRepository" = {
              urls = [
                {
                  template = "https://nur.nix-community.org/";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = nixSnowflakeIcon;
              definedAliases = [ "@nur" ];
            };
          };
      };
    };
  };
}
