{
  inputs,
  pkgs,
}:

let
  inherit (pkgs) lib;

  inherit (builtins) stringLength;
  inherit (lib.attrsets) mapCartesianProduct;
  inherit (lib.attrsets) mergeAttrsList;
  inherit (lib.lists) optional;

  inherit (inputs.home-manager.lib) homeManagerConfiguration;

  users = [
    "jacobkoziej"
  ];

  hosts = [
    "voyager-1"
  ];

  genConfig =
    user: host:

    (homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {
        inherit inputs;
      };

      modules = [
        ./homes/${user}
      ] ++ optional (stringLength host > 0) ./hosts/${host}/home-configuration.nix;
    });

  userConfigs = mapCartesianProduct (
    { user }:

    {
      "${user}" = genConfig user "";
    }
  ) { user = users; };

  hostConfigs =
    mapCartesianProduct
      (
        { user, host }:

        {
          "${user}@${host}" = genConfig user host;
        }
      )
      {
        user = users;
        host = hosts;
      };

  homeConfigurations = mergeAttrsList (userConfigs ++ hostConfigs);
in
homeConfigurations
