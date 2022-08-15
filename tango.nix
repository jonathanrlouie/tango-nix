{ appImageRun, tangoApp, stdenv }:
stdenv.mkDerivation {
  name = "tango-battle";
  src = ./.;
  buildPhase = ''
    touch tango
    chmod +x tango
    echo '${appImageRun}/bin/appimage-run ${tangoApp}' >> tango
  '';
  installPhase = ''
    mkdir -p $out/bin
    mv tango $out/bin
  '';
}
