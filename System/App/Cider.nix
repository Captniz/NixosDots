{
  lib,
  appimageTools,
  fetchurl,
}:

let
  version = "2.3.2";
  pname = "cider";

  src = fetchurl {
    url = "file://${./Cider-${version}.AppImage}";
    sha256 = "0b12bd6f47f65f669d55dcdbe16c4164b9b4a32ff773fa73d393b98098f30ecd";
  };

  appimageContents = appimageTools.extractType1 { inherit name src; };
in
appimageTools.wrapType2 rec {
  inherit pname version src;

  extraInstallCommands =
    let
      contents = appimageTools.extract { inherit pname version src; };
    in
    ''
      mv $out/bin/${pname}-${version} $out/bin/${pname}

      install -m 444 -D ${contents}/${pname}.desktop -t $out/share/applications
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
      cp -r ${contents}/usr/share/icons $out/share
    '';

  meta = with lib; {
    description = "A new look into listening and enjoying Apple Music in style and performance.";
    homepage = "https://cider.sh/";
    maintainers = [ maintainers.nicolaivds ];
    platforms = [ "x86_64-linux" ];
  };

}
