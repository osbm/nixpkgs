{
  lib,
  stdenv,
  fetchFromGitHub,
  nix-update-script,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "byedpi";
  version = "0.16.6";

  src = fetchFromGitHub {
    owner = "hufrea";
    repo = "byedpi";
    tag = "v${finalAttrs.version}";
    hash = "sha256-8iGmEfc/7ZLZmMdxuH6SjO1Wb/KuiLUJeYjrtnplalE=";
  };

  installPhase = ''
    runHook preInstall
    install -Dm755 ciadpi $out/bin/ciadpi
    runHook postInstall
  '';

  strictDeps = true;

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "SOCKS proxy server implementing some DPI bypass methods";
    homepage = "https://github.com/hufrea/byedpi";
    changelog = "https://github.com/hufrea/byedpi/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ averyanalex ];
    platforms = with lib.platforms; linux ++ windows;
    mainProgram = "ciadpi";
  };
})
