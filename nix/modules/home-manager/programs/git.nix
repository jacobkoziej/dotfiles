{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  programs.git = {
    enable = mkDefault true;

    lfs.enable = true;

    settings = {
      user = {
        name = "Jacob Koziej";
        email = "jacobkoziej@gmail.com";
      };

      alias = {
        a = "add";
        b = "blame";
        br = "branch";
        c = "commit";
        cl = "clean";
        co = "checkout";
        d = "diff";
        f = "fetch";
        l = "log";
        p = "push";
        pu = "pull";
        r = "reset";
        re = "rebase";
        s = "status";
        st = "stash";
      };

      checkout = {
        workers = 0;
      };

      color = {
        ui = "auto";
      };

      commit = {
        verbose = true;
      };

      core = {
        editor = "nvim";
      };

      init = {
        defaultBranch = "master";
      };

      merge = {
        ff = false;
      };

      pull = {
        ff = true;
        rebase = false;
      };

      push = {
        autoSetupRemode = true;
      };

      submodule = {
        recurse = true;
      };
    };

    signing = {
      format = "openpgp";
      key = "1BF98D10E0D00B41572358364C133A84E6469228";
      signByDefault = true;
    };
  };
}
