{
  description = "Linux Application Modding Platform. A native Linux mod manager.";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.callPackage ./default.nix {inherit pkgs;};
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            git
            curl
            cmake
            ninja
            pkg-config
            SDL2
          ];
        };
      });
}
