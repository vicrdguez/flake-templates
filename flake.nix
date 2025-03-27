{
  description = "Vic's personal collection of nix flake templates";
  outputs = { ... }:
    let
      mkTpl =
        { name
        , desc
        , path
        , additionalSetup ? null
        }: {
          inherit path;
          description = name;
          welcomeText = ''
            # ${name}
            ${desc}
            ${
                if additionalSetup != null 
                then '' 
                    ## Additional setup
                    ${additionalSetup}
                ''
                else ""
            }

            If you use direnv run:

            ```
                direnv allow
            ```

            Otherwise you can delete the `.envrc` file

            Finally, update all the `changeme` text inside `flake.nix` for values relevant to your
            project
          '';

        };
    in
    {
      templates = {
        rust-basic = mkTpl {
          path = ./src/rust;
          name = "Basic Rust template";
          desc = ''
            A basic rust template that uses fenix to fetch rust tooling and naersk to compile
          '';
        };
        go-basic = mkTpl {
          path = ./src/go;
          name = "Basic Golang template";
          desc = ''
            A barebones golang template
          '';
          additionalSetup = ''
            The go project is not setup, run:

            ```
                go mod init github.com/<user>/<name>
            ```
          '';
        };
        tf-azure = mkTpl {
          path = ./src/terraform/azure;
          name = "Terraform-azure template";
          desc = ''
            Tools for developing terraform modules for azure
          '';
        };
        tofu-azure = mkTpl {
          path = ./src/tofu/azure;
          name = "OpenTofu-azure template";
          desc = ''
            Tools for developing OpenTofu modules for azure
          '';
        };
      };
    };
}
