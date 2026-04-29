{
  description = "Python development environment using uv";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            uv
            python3 # Minimal python just to bootstrap if needed
            steam-run
          ];

          shellHook = ''
            # Create a virtual environment if it doesn't exist
            if [ ! -d ".venv" ]; then
              uv venv
            fi
            source .venv/bin/activate

            echo "🐍 Python Dev Environment Loaded"
            echo "Use 'uv add <package>' to install dependencies"
          '';

          # This helps uv find system libraries when compiling/linking C extensions
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
            pkgs.stdenv.cc.cc
            pkgs.zlib
          ];
        };
      });
}
