{ pkgs }:
let
    imgLink = "https://github.com/Captniz/Wallpapers/45.jpg";

    image = pkgs.fetchurl {
        url = imgLink;
        sha256 = "sha256-1vbk9rspqaxpjlrm57wkban7jvsxzlagal4w1yw890h38k92wqz3";
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