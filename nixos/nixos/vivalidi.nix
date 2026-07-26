{ config, pkgs, lib, ... }:

let
  cfg = config.programs.vivaldi-wayland;
in {
  options.programs.vivaldi-wayland = {
    enable = lib.mkEnableOption "Vivaldi Wayland screen sharing configuration";
    
    desktopBackend = lib.mkOption {
      type = lib.types.str;
      default = "gtk";
      description = "The primary XDG desktop portal backend to use (e.g., gtk, kde, gnome, wlr).";
    };
  };

  config = lib.mkIf cfg.enable {
      services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    xdg.portal = {
      enable = true;
      wlr.enable = lib.mkDefault true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config = {
        common = {
          default = [ cfg.desktopBackend ];
        };
      };
    };
    environment.systemPackages = [
      (pkgs.vivaldi.override {
        commandLineArgs = "--enable-features=WebRTCPipeWireCapturer --ozone-platform-hint=auto";
      })
    ];
  };
}

