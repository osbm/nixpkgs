{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "distlib";
  version = "0.3.9";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-pg8g3qZGuKM/Pndy903AstB3LSg37hNCoAZFyB7flAM=";
  };

  nativeBuildInputs = [ setuptools ];

  postFixup = lib.optionalString (!stdenv.hostPlatform.isWindows) ''
    find $out -name '*.exe' -delete
  '';

  pythonImportsCheck = [
    "distlib"
    "distlib.database"
    "distlib.locators"
    "distlib.index"
    "distlib.markers"
    "distlib.metadata"
    "distlib.util"
    "distlib.resources"
  ];

  # Tests use pypi.org.
  doCheck = false;

  meta = with lib; {
    description = "Low-level components of distutils2/packaging";
    homepage = "https://distlib.readthedocs.io";
    license = licenses.psfl;
    maintainers = with maintainers; [ lnl7 ];
  };
}
