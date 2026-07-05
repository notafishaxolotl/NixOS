{ config, pkgs, inputs, lib, ... }:

let
  spicetify-nix = import <spicetify-nix>;
in
{
  home.username = "acito";
  home.homeDirectory = "/home/acito";
 
  imports = [
    inputs.zen-browser.homeModules.beta
    ./unstable.nix
  ];
  
  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa];
  };

  home.stateVersion = "25.11"; 
  
  nixpkgs.config.allowUnfree = true;

  programs.spicetify =
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
  {
    enable = true;

    theme = spicePkgs.themes.hazy;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
        #oneko
      beautifulLyrics
      fullScreen
      betterGenres
      powerBar
      wikify
      featureShuffle
      oldSidebar
      songStats
      oldLikeButton
      oldCoverClick
      playingSource
      oldSidebar
      fullAlbumDate
    ];

    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
    ];

    enabledSnippets = with spicePkgs.snippets; [
      rotatingCoverart
    ];
  };

  nixpkgs.config.permittedInsecurePackages = [
    "python3.13-ecdsa-0.19.1"
  ];

  home.packages = with pkgs; [
    neo-cowsay
    cmatrix
    cava
    mapscii
    pipes
    peaclock
    android-tools
    krita
    scrcpy
    btop-rocm
    #duckstation
    pcsx2
    rpcs3
    sl 
    ardour
    hollywood
    spotify-player
    esptool
    espflash
    usbimager
    unzip
    p7zip
    activate-linux
    gnome-disk-utility
    kicad
    #libreoffice
    prismlauncher
    jdk25
    localsend
    droidcam
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  #rice-able discord
  programs.vesktop.enable = true;
}
