{
  perSystem =
    {
      lib,
      pkgs,
      ...
    }:

    {
      devShells.default = pkgs.mkShellNoCC (
        let
          pre-commit-bin = "${lib.getBin pkgs.pre-commit}/bin/pre-commit";

        in
        {
          packages = with pkgs; [
            commitlint-rs
            shellcheck
            shfmt
            statix
            treefmt
          ];

          shellHook = ''
            ${pre-commit-bin} install --allow-missing-config > /dev/null
          '';
        }
      );
    };
}
