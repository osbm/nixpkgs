{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "mricrogl";
  version = "1.2.20220720";

  src = fetchFromGitHub {
    owner = "rordenlab";
    repo = "MRIcroGL";
    rev = "v${version}";
    sha256 = "";
  };


  nativeBuildInputs = [
    lib.makeBinPath
    lib.makeLibraryPath
    lib.makeSearchPath
  ];

  meta = {
    description = "MRIcroGL is a cross-platform NIfTI viewer";
    maintainers = [ lib.maintainers.osbm ];
    # license = licenses.gpl2Plus; // weird licensing
    homepage = "https://www.nitrc.org/plugins/mwiki/index.php/mricrogl:MainPage";
    platforms = lib.platforms.linux; # TODO: also macos possible
  };
}
