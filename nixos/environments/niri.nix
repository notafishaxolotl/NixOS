{ inputs, config, pkgs, ...}:

{

  programs.niri = {
    enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    mako
    imagemagick
    fuzzel
    matugen
    waypaper
    waybar
    hyprpolkitagent
    playerctl
    nwg-look
    swaynotificationcenter
    wireplumber
    xwayland-satellite
    hyprpolkitagent
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.dbus.enable = true;
  services.gnome.gnome-keyring.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

}
