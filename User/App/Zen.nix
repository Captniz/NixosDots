{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}:
{
  imports = [
    ../Themes/${userSettings.theme}/Firefox-override.nix
  ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];
    policies = {
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

    policies =
      let
        mkExtensionSettings = builtins.mapAttrs (
          _: pluginId: {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
            installation_mode = "force_installed";
          }
        );
      in
      {
        ExtensionSettings = mkExtensionSettings {
          "wappalyzer@crunchlabz.com" = "wappalyzer";
          "{85860b32-02a8-431a-b2b1-40fbd64c9c69}" = "github-file-icons";
        };
      };

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
          "browser.tabs.warnOnClose" = false;
          "browser.contentblocking.category" = "strict";
          "extensions.pocket.enabled" = false;
          "extensions.screenshots.disabled" = true;
          "fission.autostart.session" = true;
          "browser.search.region" = "IT";
          "doh-rollout.home-region" = "IT";
          "browser.startup.page" = 3;
          "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
          "browser.toolbars.bookmarks.visibility" = "never";
          "accessibility.typeaheadfind.flashBar" = 0;
          "dom.forms.autocomplete.formautofill" = true;
          "privacy.userContext.enabled" = true;
          "privacy.userContext.extension" = "treestyletab@piro.sakura.ne.jp";
          "privacy.userContext.ui.enabled" = true;
          "security.sandbox.content.tempDirSuffix" = "985d528a-62b5-400a-a18d-b00f8131f702";
          "services.sync.declinedEngines" = "addons,prefs";
          "services.sync.engine.addons" = false;
          "services.sync.engine.creditcards" = true;
          "services.sync.engine.prefs" = false;
          "services.sync.engine.prefs.modified" = false;
          "extensions.autoDisableScopes" = 0;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "extensions.activeThemeID" = "{eb8c4a94-e603-49ef-8e81-73d3c4cc04ff}";
        };
      };

    profiles.simo = {
      id = 0; # 0 is the default profile; see also option "isDefault"
      name = "simo"; # name as listed in about:profiles
      isDefault = true; # can be omitted; true if profile ID is 0
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        tree-style-tab
        youtube-shorts-block
      ];

      search.engines = {
        "nix_packages" = {
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
          definedAliases = [ "@mn" ];
        };

        "youtube" = {
          urls = [
            {
              template = "https://www.youtube.com/results?";
              params = [
                {
                  name = "search_query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          definedAliases = [ "@yt" ];
        };
      };

      search.force = true;

      userChrome = ''
        /* Source: https://gist.github.com/teksisto/d6b4d37219e957d9cdcdb3ec88952c15 */

        /*@namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul"); /* only needed once */

        /* Hide main tabs toolbar */
        #main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar {
          visibility: collapse;
          pointer-events: none;
        }
        #main-window:not([tabsintitlebar="true"]) #TabsToolbar {
          visibility: collapse !important;
        }

        /* Hide sidebar header, when using Tree Style Tab. */
        #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
          visibility: collapse;
        }
      '';

    };

    old_default = {
      id = 1;
      name = "old_default";
      path = "old_default";
    };

  };
}
