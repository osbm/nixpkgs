{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # depencencies
  hatchling,
  gradio,
  huggingface-hub,
  numpy,
  pandas,
  pillow,
}:

buildPythonPackage rec {
  pname = "trackio";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gradio-app";
    repo = "trackio";
    tag = "v${version}";
    hash = "sha256-TRj7ZNldg520RMJEu8+W0R4Ck7U9TJEYKL/WnoXczT4=";
  };

  build-system = [ hatchling ];

  dependencies = [
    gradio
    huggingface-hub
    numpy
    pandas
    pillow
  ];

  pythonImportsCheck = [ "trackio" ];

  meta = {
    description = "A lightweight experiment tracking library";
    mainProgram = "trackio";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ osbm ];
    homepage = "https://github.com/gradio-app/trackio";
  };
}



