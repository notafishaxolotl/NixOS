{inputs, config, pkgs, ...}:

{

  services.xserver.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [
      luarocks
      lgi
    ];
  };
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
    feh
    rofi
    kando
    alacritty
    polybarFull
    eww
    libnotify
    playerctl
    polkit_gnome
    xrandr
  ];

}

