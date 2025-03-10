{
  description = "Flake to work with Terraform resources an Azure";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.utils = "github:numtide/flake-utils";
  inputs.dsh.url = "github:numtide:devshell";

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
        devShell = dsh.mkShell {
          packages = with pkgs;
            [
              azure-cli
              terraform
              terraform-docs
            ];
          env = {
            test = "numtide";
          };
        };
      }
    ));
}
