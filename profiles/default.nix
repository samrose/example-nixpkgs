{

  imports = [ ../modules ];

  nixpkgs.overlays = [ (import ../overlays/example-nixpkgs) ];
}
