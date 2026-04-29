{
  description = "A simple Go development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            go
            gopls            # Language Server
            gotools         # Includes godoc, etc.
            go-tools        # Includes staticcheck
          ];

          shellHook = ''
            # Only add the local project bin to PATH if you plan on 
            # installing project-specific tools.
            export PATH="$PWD/.go/bin:$PATH"
          
            echo "🐹 Go environment active. Using global ~/go and project ./go/bin"
            go version
          '';
        };
      });
}
