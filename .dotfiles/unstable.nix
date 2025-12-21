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

  home.packages = with pkgs; [
    ryubing
    blender
    android-studio
    clang-tools
    glslang
  ];
}
