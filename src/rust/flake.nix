{
  inputs = {
    # Build outputs for multiple systems
    flake-utils.url = "github:numtide/flake-utils";
    # Build rust applications 
    naersk.url = "github:nix-community/naersk";
    # Get rust components (like with rustup)
    fenix.url = "github:nix-community/fenix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  outputs = { self, flake-utils, naersk, fenix, nixpkgs }:

    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ fenix.overlays.default ];
        };
        naersk' = pkgs.callPackage naersk { };
        # change name of your project
        pname = "rust-project";
        # rust components
        rust-components = (pkgs.fenix.stable.withComponents [
          "cargo"
          "clippy"
          "rust-src"
          "rustc"
          "rustfmt"
        ]);
      in
      {
        packages = {
          default = naersk'.buildPackage {
            name = pname;
            src = ./.;
          };
        };
        devShells.default = pkgs.mkShell {
          name = pname;
          nativeBuildInputs = [
            pkgs.rust-analyzer
            rust-components
          ];
        };
      }
    );
}

