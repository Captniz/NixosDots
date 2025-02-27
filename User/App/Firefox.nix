{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;

  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };

in
{
  programs.firefox = {

    # Config credit:
    #
    # [sleepy]:
    # https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265/7

    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisableTelemetry = true;
        DisableAppUpdate = true;
        # add policies here...

        # ---- EXTENSIONS ----
        ExtensionSettings = {
          "*".installation_mode = "blocked"; # blocks all addons except the ones specified below

          # Mozzilla Add-ons Search Detection:
          "addons-search-detection@mozilla.com".installation_mode = "force_installed";

          # Default Theme
          "default-theme@mozilla.org".installation_mode = "force_installed";

          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };

          # adGuard:
          "adguardadblocker@adguard.com" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/adguard-adblocker/latest.xpi";
            installation_mode = "force_installed";
          };

          # treeStyleTab:
          "treestyletab@piro.sakura.ne.jp" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/tree-style-tab/latest.xpi";
            installation_mode = "force_installed";
          };

          # add extensions here...
        };

        # ---- PREFERENCES ----
        # Set preferences shared by all profiles.
        Preferences = {
          "browser.contentblocking.category" = {
            Value = "strict";
            Status = "locked";
          };
          "extensions.pocket.enabled" = lock-false;
          "extensions.screenshots.disabled" = lock-true;
          "fission.autostart.session" = lock-true;
          "browser.search.region" = "IT";
          "doh-rollout.home-region" = "IT";
          # add global preferences here...
        };
      };
    };

    # ---- PROFILES ----
    # Switch profiles via about:profiles page.
    # For options that are available in Home-Manager see
    # https://nix-community.github.io/home-manager/options.html#opt-programs.firefox.profiles
    profiles = {
      simo = {
        # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
        id = 0; # 0 is the default profile; see also option "isDefault"
        name = "simo"; # name as listed in about:profiles
        isDefault = true; # can be omitted; true if profile ID is 0
        settings = {
          # specify profile-specific preferences here; check about:config for options
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
          # add preferences for profile here...
        };
      };

      old_default = {
        id = 1;
        name = "old_default";
        path = "/home/simo/.mozilla/firefox/old_default";
      };
      # add profiles here...
    };
  };
}
