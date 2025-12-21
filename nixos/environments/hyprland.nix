{ inputs, config, pkgs, ...}:

{

  programs.hyprland.enable = true;
  
  environment.systemPackages = with pkgs; [
    fuzzel
    matugen
    waypaper
    waybar
    eww
    hyprpolkitagent
    btop-rocm
    playerctl
    nwg-look
    swaynotificationcenter
    wireplumber
  ];

}
