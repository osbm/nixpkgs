{
  lib,
  stdenvNoCC,
  fetchzip,
  nix-update-script,
}:

stdenvNoCC.mkDerivation rec {
  pname = "smiley-sans";
  version = "2.0.1";

  src = fetchzip {
    url = "https://github.com/atelier-anchor/smiley-sans/releases/download/v${version}/smiley-sans-v${version}.zip";
    sha256 = "sha256-p6DwX5MBPemAfV99L9ayLkEWro31ip4tf+wBQr8mkbs=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    install -Dm644 -t $out/share/fonts/opentype *.otf
    install -Dm644 -t $out/share/fonts/truetype *.ttf
    install -Dm644 -t $out/share/fonts/woff2 *.woff2
    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "Condensed and oblique Chinese typeface seeking a visual balance between the humanist and the geometric";
    homepage = "https://atelier-anchor.com/typefaces/smiley-sans/";
    changelog = "https://github.com/atelier-anchor/smiley-sans/blob/main/CHANGELOG.md";
    license = licenses.ofl;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
