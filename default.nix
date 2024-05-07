{pkgs, stdenv}:

stdenv.mkDerivation {
  pname = "Lampray";
  version = "1.3.2";
  src = ./.;

  buildInputs = with pkgs; [SDL2 curl lz4];

  nativeBuildInputs = with pkgs; [cmake ninja pkg-config autoPatchelfHook];

  cmakeBuildType = "Debug";
  cmakeFlags = [
    "-DCMAKE_MAKE_PROGRAM=ninja"
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp ./Lampray $out/bin
  '';
}
