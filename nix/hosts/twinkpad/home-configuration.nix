{
  home = {
    stateVersion = "26.05";
  };

  jacobkoziej = {
    programs = {
      development-tools.enable = true;
      document-viewers.enable = true;
    };

    services = {
      messaging.enable = true;
      web-browser.enable = true;
      windowManager.enable = true;
    };
  };

  programs = {
    alacritty.settings.font.size = 15;
  };

  xresources.properties = {
    "Xft.dpi" = 160;
  };
}
