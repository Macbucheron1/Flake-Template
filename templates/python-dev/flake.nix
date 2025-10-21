{
  description = "Dev Flake for Python Development";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs   = import nixpkgs { inherit system; };
    name   = "Py-Programming";

    # Choisis ta version de Python ici :
    py = pkgs.python312;

    # Ajoutes tes paquets Python ici :
    pyEnv = py.withPackages (ps: with ps; [
    ]);

    devPackages = with pkgs; [
      bashInteractive   # évite les soucis de shopt/progcomp dans VS Code
    ];

  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = devPackages ++ [ pyEnv ];

      shellHook = ''
        export PS1="\n\[\033[1;35m\][nix-shell ${name}]\[\033[0m\] "
      '';
    };
  };
}
