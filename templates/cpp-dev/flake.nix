{
  description = "Dev Flake for Cpp Programming";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    name = "Cpp-Programming";

    devPackages = with pkgs; [
      gcc
      clang-tools
    ];

  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = devPackages;
      shellHook = ''
        export PS1="\n\[\033[1;35m\][nix-shell ${name}]\[\033[0m\] "
      '';
    };
  };
}
