{
  inputs,
  ...
}:

let
  inherit (builtins) to String;

  secrets = toString inputs.secrets;

in
{
  security.pki = {
    certificateFiles = [
      (secrets + "/.mkcert/rootCA.pem")
    ];
  };
}
