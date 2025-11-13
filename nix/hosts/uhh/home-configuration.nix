_:

{
  home = {
    stateVersion = "25.05";
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

  xresources.properties = {
    "Xft.dpi" = 160;
  };
}
