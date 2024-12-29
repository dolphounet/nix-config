{pkgs}:
pkgs.stdenv.mkDerivation {
  pname = "epson-font";
  version = "1.0";

  src = ../fonts/Epson;

  installPhase = ''
    runHook preInstall

    install -DC $src/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
