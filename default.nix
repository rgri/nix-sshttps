{ lib, fetchFromGitHub, stdenv, autoPatchelfHook, libcap }:
stdenv.mkDerivation rec {
  name = "sshttp";
  version = "91be220338249e9c7a937c8d9790f559a9fe1a60";
  src = fetchFromGitHub {
    owner = "stealth";
    repo = name;
    rev = version;
    hash = "sha256-GzlQDlKmiAscb9CGxmSeQnu6IvIRKm7Y6dDQ+oIbuDU=";
  };
  installPhase = ''
    chmod 755 $out
  '';
  buildPhase = ''
    cd src
    make
    mkdir -p $out
    cp -r * $out
  '';
  buildInputs = [ libcap.dev ];

  meta = with lib; {
    description = "Tool to hide SSH servers behind HTTP";
    homepage = "https://github.com/stealth/sshttp";
    # REVIEW: is this right?
    license = licenses.mit;
    maintainers = with stdenv.lib.maintainers; [ ];
    platforms = [ "x86_64-linux" ];
  };
}

# TODO: The license is 4-clause BSD, not MIT
# TODO: And usually something like mkdir -p $out; cp -r * $out would be in the installPhase
# TODO: Also set platforms = platforms.linux, unless the program really only works on x86.
