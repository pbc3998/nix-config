{ pkgs }:
pkgs.mkShell {
  formatter = pkgs.nixfmt-tree;
  nativeBuildInputs = [
    pkgs.nixd
    pkgs.nixfmt-rfc-style
    pkgs.nh
    pkgs.home-manager
  ];
  shellHook = "";
}
