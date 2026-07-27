{ config, pkgs, lib, ... }:

{
  services.displayManager.ly = {
    enable = true;
    x11Support = true;
    settings = {
      # Visual Customization
      animate = true;
      animation = 1;
      animation_frame_delay = 11;
      bigclock = true;
      blank_box = false;
      box_title = "Welcome!";
      
      bg = 1;
      fg = 8;
      border_fg = 8;
      active_fg = 8;
      
      clear_password = true;
      hide_fkeys = false;
      save = true;
      default_input = 0;
      numlock = true;
      
      lang = "en";
    };
  };
  environment.systemPackages = with pkgs; [
    ];
}

