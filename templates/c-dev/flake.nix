{
  description = "Dev Flake for C Programming";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs   = import nixpkgs { inherit system; };
    name   = "C-Programming";
    version = "1.0.0";
    src = ./.;

    # Ajoutes tes paquets de développement ici :
    devPackages = with pkgs; [
      gcc
      clang-tools
      cmake
    ];
    
  in {
    packages.${system} = {
      ${name} = pkgs.stdenv.mkDerivation {
        inherit name version src;
        nativeBuildInputs = [ pkgs.cmake ];
        buildInputs = devPackages;
        dontStrip = true;

        configurePhase = ''
          cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
        '';

        buildPhase = ''
          cmake --build build
        '';

        installPhase = ''
          cmake --install build --prefix $out
        '';
      };
      
      default = self.packages.${system}.${name};
    };


    devShells.${system}.default = pkgs.mkShell {
      packages = devPackages;
      shellHook = ''
        export PS1="\n\[\033[1;35m\][nix-shell ${name}]\[\033[0m\] "
      '';
    };
  };
}
