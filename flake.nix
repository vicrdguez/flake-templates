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
      };
    };
}
