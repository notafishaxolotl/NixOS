{ inputs, config, pkgs, ... }:

{
  imports = [
    # Include hardware and service profiles

    ./hardware-configuration.nix
    ./obs.nix
    ./vm.nix
    ./drives.nix
    ./unstable.nix
    ./zsh.nix
    ./login.nix
    ./tmux.nix

    # Desktop environments

    #./environments/hyprland.nix
    ./environments/openbox.nix
    ./environments/niri.nix
    ./environments/labwc.nix
  ];

  # Enable PolicyKit for privilege escalation dialogs
  security.polkit.enable = true;

  # Kernel configuration
  boot.kernelPackages = pkgs.linuxPackages_zen; 
  boot.kernelModules = [ "kvm-amd" ];           # Required for AMD virtualization
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "udev.log_priority=3"
    "rd.systemd.show_status=auto"
  ];

  services.udev.packages = with pkgs; [ game-devices-udev-rules ];

  # Bootloader setup: GRUB configured for EFI systems and dual-boot
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";         # For EFI systems, specify actual device otherwise
    useOSProber = true;       
    theme = "/etc/nixos/Afro";
    extraConfig = ''
      set gfxmode=1024x768
      set gfxpayload=keep
    '';
  };
  boot.loader.timeout = 7;
  boot.loader.efi.canTouchEfiVariables = true;

  # Plymouth: Graphical boot splash
  boot.plymouth = {
    enable = true;
    theme = "cubes";
    themePackages = with pkgs; [
      (adi1090x-plymouth-themes.override {
        selected_themes = [ "cubes" ];
      })
    ];
  };

  # Hostname for this system
  networking.hostName = "Nix";

  # Enable NetworkManager for device/network management
  networking.networkmanager.enable = true;

  # Set system timezone
  time.timeZone = "Europe/London";

  # Localization settings
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Keyboard layout for X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Enable mounting of drives via udisks2
  services.udisks2.enable = true;
  
  # Enable Flatpak for containerized desktop applications
  services.flatpak.enable = true;

  # Enable X server
  services.xserver.enable = true;

  # Graphics drivers (AMD)
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
#    amdvlk
    mesa.opencl   
    rocmPackages.clr.icd
  ];

  # Console keyboard layout
  console.keyMap = "uk";

  # User configuration (replace 'acito' with your username if needed)
  users.users.acito = {
    isNormalUser = true;
    description = "Acito";
    extraGroups = [ "networkmanager" "wheel" "dialout" ]; # Network admin and sudo
    packages = with pkgs; [];
  };

  # Allow installation of unfree packages
  nixpkgs.config.allowUnfree = true;

  # Experimental Nix features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "ca-derivations"
    "auto-allocate-uids"
  ];

  #neovim
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    vimAlias = true;
    viAlias = true;
  };

  # Enable Steam gaming platform
  programs.steam.enable = true;

  # Enable Bluetooth functionality
  hardware.bluetooth.enable = true;

  # System-wide package selection
  environment.systemPackages = with pkgs; [
    kitty 
    imagemagick
    vivaldi
    feh
    git
    superfile
    wget
    fastfetch
    swww
    trashy
    home-manager 
    warehouse
    xfce.ristretto
    bluetui
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    direnv
    clang
    gcc
  ];

  # Extra fonts (With all Nerd Fonts)
  fonts.packages = with pkgs; [
    dina-font
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  # (Uncomment and configure services below as needed)

  # Enable OpenSSH daemon for remote access
  # services.openssh.enable = true;

  # System state version (DO NOT change unless you know what you're doing)
  # This determines default locations and settings for stateful data.
  system.stateVersion = "25.05"; # Set on first install and recommended to keep constant
}
