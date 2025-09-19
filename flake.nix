{
  description = "Flake for R development";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = [pkgs.bashInteractive];
        buildInputs = with pkgs; [
          R
          rPackages.ggplot2
          rPackages.dplyr
          rPackages.tidyr
          rPackages.broom
          rPackages.kableExtra
          rPackages.languageserver
          rPackages.pacman
          rPackages.car
          binutils
          blas
          gcc
          gfortran
          gfortran.cc.lib
          gnum4
          lapack
          libgccjit
          openblas
          perl
          zlib
          glxinfo
          (python313.withPackages (ppkgs: [
            ppkgs.pynvim
            ppkgs.flake8
            ppkgs.scipy
            ppkgs.black
            ppkgs.mdformat
            ppkgs.isort
            ppkgs.jupyter
            ppkgs.ipykernel
            ppkgs.jupyter-cache
          ]))
        ];
        shellHook = ''
          export LD_LIBRARY_PATH="${pkgs.gfortran.cc.lib}/lib"
        '';
      };
    });
}
