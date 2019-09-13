{ pkgs ? import ./. {} }:

with pkgs;

let
  root = toString ./.;
in

mkShell {
  shellHook = ''
    nixos-shell() {
      $(nix-build default.nix -A example-nixpkgs.qemu -I nixos-config=profiles/$1 --no-out-link)/bin/run-example-vm
    }
  '';

  NIX_PATH = builtins.concatStringsSep ":" [
    "example-nixpkgs=${root}"
    "nixpkgs=${root}/nixpkgs"
    "nixpkgs-overlays=${root}/overlays"
  ];

  QEMU_OPTS = "-m 3048 -nographic";
}
