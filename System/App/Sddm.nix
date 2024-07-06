{ pkgs }:
let
    imgLink = "https://github.com/Captniz/Wallpapers/45.jpg";

    image = pkgs.fetchurl {
        url = imgLink;
        sha256 = "1yvpwm6g1k6y0sf8rpw73fr8mbl9nb2knf6sgd21g1pz4vc0h5rc";
    };
in
pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
        owner = "Kangie";
        repo = "sddm-sugar-candy";
        rev = "a1fae5159c8f7e44f0d8de124b14bae583edb5b8";
        sha256 = "18wsl2p9zdq2jdmvxl4r56lir530n73z9skgd7dssgq18lipnrx7";
    };

    installPhase = ''
        mkdir -p $out
        cp -R ./* $out/
        cd $out/
        rm Background.jpg
        cp -r ${image} $out/Background.jpg
    '';
}    