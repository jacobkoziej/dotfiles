{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

  fontFamily = "Fira Code Nerd Font";

in
{
  programs.alacritty = {
    enable = mkDefault true;

    theme = "nord";

    settings = {
      general = {
        live_config_reload = true;
      };

      env = {
        "TERM" = "xterm-256color";
      };

      window = {
        dynamic_padding = true;
      };

      scrolling = {
        multiplier = 2;
      };

      font = {
        normal.family = fontFamily;
        bold.family = fontFamily;
        italic.family = fontFamily;
        bold_italic.family = fontFamily;

        size = mkDefault 13;
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "Off";
        };
        unfocused_hollow = true;
      };

      mouse = {
        hide_when_typing = true;
      };

      keyboard.bindings = [
        {
          key = "Space";
          mods = "Shift|Control";
          mode = "~Search";
          action = "ReceiveChar";
        }
      ];
    };
  };
}
