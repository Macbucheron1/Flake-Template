{
  description = "Dev Flake for C Programming";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs   = import nixpkgs { inherit system; };
    name   = "C-Programming";

    devPackages = with pkgs; [
      gcc
      clang-tools
      bashInteractive   # évite les soucis de shopt/progcomp dans VS Code
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
