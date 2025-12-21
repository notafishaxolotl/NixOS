{ inputs, config, pkgs, ...}:

{

  services.xserver.windowManager.openbox.enable = true;
  services.picom = {
    enable =true;
  };


  services.xserver.enable = true;
  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.deviceSection = ''
  Option "TearFree" "true"
'';
  services.xserver.exportConfiguration = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    rofi
    dmenu
    ghostty
    paperview
    polybarFull
    eww
    libnotify
    playerctl
    openbox-menu
    obconf
  ];

}
