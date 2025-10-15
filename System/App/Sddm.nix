{ pkgs }:
let
  imgLink = "https://raw.githubusercontent.com/Captniz/Wallpapers/main/45-b.jpg";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "1258wyz6cxc5wsrivdj0jly9cqr09bc6w3f6f42ycxmmghfdqbcv";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitLab {
    owner = "Matt.Jolly";
    repo = "sddm-eucalyptus-drop";
    rev = "v2.0.0";
    sha256 = "wq6V3UOHteT6CsHyc7+KqclRMgyDXjajcQrX/y+rkA0=";
  };
  dontWrapQtApps = true;
  buildInputs = with pkgs; [
    kdePackages.qt5compat
    kdePackages.qtdeclarative
    kdePackages.qtsvg
    pkgs.qt6.qt5compat
    pkgs.qt6.qtdeclarative
    pkgs.qt6.qtsvg
    kdePackages.sddm
  ];

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Backgrounds/Mountain.jpg
    cp -r ${image} $out/Backgrounds/Mountain.jpg
  '';
}
