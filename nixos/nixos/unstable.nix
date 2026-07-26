{ config, pkgs, pkgs-unstable, ... }:

{
  
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import <nixpkgs> {
        config = config.nixpkgs.config;
      };
    };
  };

  environment.systemPackages = with pkgs; [
      unstable.davinci-resolve
    ];
  # Or, for a specific option:
  # programs.mpv.package = pkgs-unstable.mpv;
  
  # ... rest of your config
}
