{
  inputs,
  ...
}:

{
  imports = [
    ./users
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };

    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
