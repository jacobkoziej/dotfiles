pkgs:

let
  inherit (pkgs) lib;

in
{
  default = pkgs.mkShellNoCC (
    let
      pre-commit-bin = "${lib.getBin pkgs.pre-commit}/bin/pre-commit";

    in
    {
      packages = with pkgs; [
        statix
        treefmt
      ];

      shellHook = ''
        ${pre-commit-bin} install --allow-missing-config > /dev/null
      '';
    }
  );
}
