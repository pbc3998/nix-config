{ pkgs }:
pkgs.mkShell {
  formatter = pkgs.nixfmt-rfc-style;
  nativeBuildInputs = [
    pkgs.nixd
    pkgs.nixfmt-rfc-style
  ];
  shellHook = '''';
}
