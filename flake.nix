{
  description = "Flake for R development";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      radonis = pkgs.rPackages.buildRPackage {
        name = "pairwiseAdonis";
        src = pkgs.fetchFromGitHub {
          owner = "pmartinezarbizu";
          repo = "pairwiseAdonis";
          rev = "cb190f7668a0c82c0b0853927db239e7b9ec3e83";
          sha256 = "sha256-KVE2u4GUaz9dPy4DJ0M0ZFUMvAAoiGQO0XaXXDE2FIY=";
        };
        propagatedBuildInputs = with pkgs.rPackages; [
          vegan
          cluster
          permute
        ];
      };
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
          rPackages.patchwork
          rPackages.pander
          rPackages.lme4
          rPackages.lmerTest
          rPackages.pacman
          rPackages.car
          rPackages.readxl
          rPackages.npmv
          rPackages.vegan
          rPackages.devtools
          rPackages.lava
          rPackages.lmPerm
          # radonis
          blas
          gcc
          gfortran
          gfortran.cc.lib
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
          export R_REMOTES_NO_ERRORS_FROM_WARNINGS="TRUE"
        '';
      };
    });
}
