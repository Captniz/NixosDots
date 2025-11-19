{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:
let
  imgLink = "https://raw.githubusercontent.com/Captniz/Wallpapers/main/45-b.jpg";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "1258wyz6cxc5wsrivdj0jly9cqr09bc6w3f6f42ycxmmghfdqbcv";
  };
in
{
  environment.systemPackages = with pkgs; [
    (sddm-astronaut.override {
      themeConfig = {
        Font = "IosevkaTermSlab";
        Background = "${image}";
        Locale = "it_IT";
        HeaderText = "Il mattino ha le palle in bocca, o cose così.";
        FormPosition = "left";
        PartialBlur = "true";
        BlurMax = "64";
        Blur = "0.8";

        HeaderTextColor = "#f9f5d7";
        DateTextColor = "#f9f5d7";
        TimeTextColor = "#f9f5d7";

        FormBackgroundColor = "#1d2021";
        BackgroundColor = "#1d2021";
        DimBackgroundColor = "#1d2021";

        LoginFieldBackgroundColor = "#1d2021";
        PasswordFieldBackgroundColor = "#1d2021";
        LoginFieldTextColor = "#f9f5d7";
        PasswordFieldTextColor = "#f9f5d7";
        UserIconColor = "#f9f5d7";
        PasswordIconColor = "#f9f5d7";

        PlaceholderTextColor = "#bdae93";
        WarningColor = "#343746";

        LoginButtonTextColor = "#f9f5d7";
        LoginButtonBackgroundColor = "#343746";
        SystemButtonsIconsColor = "#F8F8F2";
        SessionButtonTextColor = "#F8F8F2";
        VirtualKeyboardButtonTextColor = "#F8F8F2";

        DropdownTextColor = "#f9f5d7";
        DropdownSelectedBackgroundColor = "#343746";
        DropdownBackgroundColor = "#21222C";

        HighlightTextColor = "#bdae93";
        HighlightBackgroundColor = "#343746";
        HighlightBorderColor = "#343746";

        HoverUserIconColor = "#98971a";
        HoverPasswordIconColor = "#98971a";
        HoverSystemButtonsIconsColor = "#98971a";
        HoverSessionButtonTextColor = "#98971a";
        HoverVirtualKeyboardButtonTextColor = "#98971a";
      };
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm; # Display manager
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
  };
}
