{pkgs}:
pkgs.stdenv.mkDerivation {
  pname = "iosevka-custom";
  version = "1.0";

  src = ../fonts/Iosevka-custom;

  installPhase = ''
    runHook preInstall

    install -DC $src/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
