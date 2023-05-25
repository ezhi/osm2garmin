{
  description = "my cfg";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
  };

  outputs = { self, nixpkgs }:
  let
    mkPackage = system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    pkgs.mkShell {
      nativeBuildInputs = with pkgs; [
        pkg-config
      ];
      buildInputs = (with pkgs; [
        just
        curl
        awscli2
        osmium-tool
        mkgmap
        mkgmap-splitter
        gdal
        python311Packages.gdal
        python311Packages.lxml
        python311Packages.protobuf
      ]);
    };
  in
  {
    defaultPackage = {
      x86_64-linux = mkPackage "x86_64-linux";
      x86_64-darwin = mkPackage "x86_64-darwin";
      aarch64-darwin = mkPackage "aarch64-darwin";
    };
  };
}
