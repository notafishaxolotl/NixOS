{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    newSession = false;

    clock24 = true;
    keyMode = "vi";
    baseIndex = 1;
    #mouse = true;
    #focusEvents = false;
    secureSocket = false;
    #disableConfirmationPrompt = false;
    historyLimit = 5000;
    escapeTime = 0;

    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      gruvbox
      #dotbar
    ];

  };

  #programs.tmuxinator = {
  #  enable = true;
  #};

  #programs.tmate = {
  #  enable = true;
  #  # FIXME: This causes tmate to hang.
  #  # extraConfig = config.xdg.configFile."tmux/tmux.conf".text;
  #};

}
