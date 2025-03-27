{
  description = "Flake to work with opentofu resources an Azure";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.utils.url = "github:numtide/flake-utils";
  inputs.dsh.url = "github:numtide/devshell";

  outputs = { dsh, nixpkgs, utils }:
    (utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ dsh.overlays.default ];
        };
      in
      {
        devShell = pkgs.devshell.mkShell {
          packages = with pkgs;
            [
              azure-cli
              opentofu
              terraform-docs
            ];
          shellHook = /*bash*/''
            alias terraform=tofu
            alias tf=tofu
          '';
          env = [
            #{ name = ""; value = ""; }
          ];
        };
      }
    ));
}
